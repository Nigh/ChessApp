

local socket=require("socket.core")
local m=require("math")

map=require("imageMap")
bitmap=require("bitmap")
debugU=require("debugInfo")
usb=require("usbParse")
disp=require("display")
cursor=require("cursor")

shaders=require("shaders")

textInfo=require("textInfo")

hid=require("hid")

rainDrop=require("raindrop")

hid.enum( 0x1130, 0x3132 )
hid.open( 0x1130, 0x3132 )
hid.set_wbuf( { 0x00, 0x55, 0x53, 0x42, 0x43, 0xff, 0xff, 0xff, 0xf2 }, 9 )

hid_data=
{
	buf={};
	bufOld={};
	sum=0;
	sumOld=0;
	Sum=function(self)
		local sum=0;
		for k,v in ipairs(self.bufOld) do
			sum=sum+v;
		end
		return sum;
	end
}


function MOUSE()
	local idleTime=0
	local statu="ACTIVE"
	local pos0={x=0,y=0}
	local pos1={x=0,y=0}
	function updatePos()
		pos0={x = pos1.x, y = pos1.y}
		pos1={x = love.mouse.getX(),
		y = love.mouse.getY()}
	end
	function idleTimer(dt)
		if(pos0.x == pos1.x and pos0.y == pos1.y and statu~="IDLE")then
			idleTime = idleTime + dt
			if idleTime > 3 then
				statu = "IDLE"
			end
		else
			if pos0.x ~= pos1.x or pos0.y ~= pos1.y  then
				idleTime = 0
				statu = "ACTIVE"
			end
		end
	end
	function getStatu()
		return statu
	end
	return {updatePos=updatePos,idleTimer=idleTimer,getStatu=getStatu}
end
mouse=MOUSE()

tween=require("tween")

function sleep(sec)
	socket.select(nil,nil,sec)
end

-- (0,0) x=(0,3066) y=(-165,802) w=3066 h=958
-- 宽度预留10% we=3406
-- 高度预留30% he=1368
function love.load(arg)
	-- [[temp.t]]
	textD={}
	file={}
	for i=1,3 do
		file[i]=io.open("temp"..i..".t","r")
		if(file[i]==nil)then
			textD[i] = nil
		else
			textD[i] = file[i]:read()
			file[i]:close()
		end
		if(textD[i] == nil)then
			textD[i] = ""
		end
	end
	textInfo.player[1].text = textD[1]
	textInfo.player[2].text = textD[2]
	textInfo.exRuleTxt = textD[3]

	-- [[temp.t]]

	-- gTrans={sx=0.4,sy=0.4,ox=70,oy=200}		-- 基于 1366x768 的 初始转换参数
	-- screen={w,h=love.window.getDesktopDimensions(1)}
	gTrans=calc_gTrans()

	FPS=0		-- 帧率
	CPS=0		-- 每秒通信次数
	debugO1=debugU.new();
	debugO1:setFont("consola.ttf",18)
	textInfo.font=love.graphics.newFont("悦黑特细体.otf",90*gTrans.sx);
	hid_inv=0	-- 间隔上次hid操作的时间
	usb_inv=0	-- 间隔上次usb成功通信的时间
	usbc_inv=0	-- 上次usb成功通信的时间
	love.mouse.setVisible(false)
	cursor1=cursor.new("cursor.png")
	cursor1:setOffset(20,20)
	cursorAngel=0

	shaders.switch:send("y",love.window.getHeight()-(gTrans.oy-10*gTrans.sy))
	shaders.switch:send("height",10*gTrans.sy)
	render_buffer = love.graphics.newCanvas(love.window.getWidth(),love.window.getHeight())
	render_buffer2 = love.graphics.newCanvas(love.window.getWidth(),love.window.getHeight())
end

-- logfile=io.open("log.log", "w")
-- count=0
-- str="\n"
-- for k,v in ipairs(hid_data.buf) do
-- 	str=str..string.format("0x%02x", v)..","
-- 	if math.fmod(k,8)==0 then
-- 		str=str.."\n"
-- 	end
-- end
-- logfile:write(count.."={"..str.."}\n")
-- count=count+1

circle = {x=0,y=0,r=100,alpha=0}

function love.update(dt)
	_dt=dt
	FPS=0.96*FPS+0.04*1/dt
	if usbc_inv>0 then
		CPS=0.9*CPS+0.1/usbc_inv
	end
	hid_inv=hid_inv+dt
	usb_inv=usb_inv+dt
	if(hid_inv>0.04)then
		hid_inv=0
		hid.write(9)
		res=hid.read_timeout( 41,1 )
		if(res>0)then
			usbc_inv=usb_inv
			usb_inv=0
			hid_data.bufOld=hid.get_rbuf( 40 )
			hid_data.sum=hid_data:Sum()
			if(hid_data.sum==hid_data.sumOld)then
				hid_data.buf=hid.get_rbuf( 40 )
			end
			hid_data.sumOld=hid_data.sum;
		end
	end
	tab=hid_data.buf
	if tab[9] then
		if(bit.band(tab[9],bit.lshift(1,7))>0 and bit.band(tab[9],bit.lshift(1,6))==0 and map.offset.switch.r~=0.03)then	-- right key
			if tid then
				if tid.target.r~=0.03 then
					tween.stop(tid)
					tid=nil
					tid=tween(0.40, map.offset.switch, {r = 0.03}, "outElastic")
				end
			else
				tid=tween(0.40, map.offset.switch, {r = 0.03}, "outElastic")
			end
		end
		if(bit.band(tab[9],bit.lshift(1,6))>0 and bit.band(tab[9],bit.lshift(1,7))==0 and map.offset.switch.r~=-0.03)then	-- left key
			if tid then
				if tid.target.r~=-0.03 then
					tween.stop(tid)
					tid=nil
					tid=tween(0.40, map.offset.switch, {r = -0.03}, "outElastic")
				end
			else
				tid=tween(0.40, map.offset.switch, {r = -0.03}, "outElastic")
			end
		end
		if(bit.band(tab[9],bit.lshift(1,6))==bit.band(tab[9],bit.lshift(1,7)) and map.offset.switch.r~=0)then	-- middle
			if tid then
				if tid.target.r~=0 then
					tween.stop(tid)
					tid=nil
					tid=tween(0.50, map.offset.switch, {r = 0}, "outBack")
				end
			else
				tid=tween(0.50, map.offset.switch, {r = 0}, "outBack")
			end
		end
	end
	tween.update(dt)
	rainDrop.update(dt)
	mouse.updatePos()
	mouse.idleTimer(dt)
	love.timer.sleep(0.01)
end



function love.draw(dt)
	love.graphics.setColor(255,255,255,255)
	render_buffer:clear()
	render_buffer2:clear()
	debugO1:clr()
	-- love.graphics.draw(bitmap.pBwhite, 100, 100)
	love.graphics.push()
		love.graphics.translate(gTrans.ox, gTrans.oy)
		love.graphics.scale(gTrans.sx, gTrans.sy)
		love.graphics.setShader(shaders.color)
		disp.drawBack()
		love.graphics.setShader()
	love.graphics.pop()
	love.graphics.setCanvas(render_buffer2)


	love.graphics.push()
		love.graphics.translate(gTrans.ox, gTrans.oy)
		love.graphics.scale(gTrans.sx, gTrans.sy)
		love.graphics.setShader(shaders.switch)
		disp.drawSwitch(hid_data.buf)
	love.graphics.pop()

	love.graphics.setCanvas(render_buffer)
	love.graphics.setShader(shaders.color)
	love.graphics.draw(render_buffer2)

	love.graphics.push()
		love.graphics.translate(gTrans.ox, gTrans.oy)
		love.graphics.scale(gTrans.sx, gTrans.sy)
		disp.drawClockUI(hid_data.buf)
		love.graphics.setShader()
		love.graphics.setCanvas()
	love.graphics.pop()

	love.graphics.draw(render_buffer)

	textInfo.showRule(hid_data.buf[40])
	textInfo.showName()

	debugO1:write("FPS:"..m.floor(FPS+0.5))
	debugO1:write("USB:"..m.floor(CPS+0.5))

	if(res)then
		str="\n"
		for k,v in ipairs(hid_data.buf) do
			str=str..string.format("0x%02x", v)..","
			if math.fmod(k,8)==0 then
				str=str.."\n"
			end
		end
		debugO1:write(str)
	end

	if mouse.getStatu()=="ACTIVE" then
		cursorAngel=cursorAngel-1>0 and cursorAngel-1 or 360
		cursor1:draw(cursorAngel)
	end
	rainDrop.draw()
end

function love.keypressed( key, isrepeat )
	if key == "escape" then
		love.event.quit()
	end
	if key == "f8" then
		os.execute("sendManager.exe")
	end
end

function love.keyreleased(key)

end

function love.mousepressed( x,y,key )
	if key=="l" then
		rainDrop.newDrop(love.mouse.getX(),love.mouse.getY(),math.random(180,300))
	end
end

function love.mousereleased( x,y,key )
	if key=="l" then
	end
end

function love.resize(newWidth,newHeight)

end

-- (0,0) x=(0,3066) y=(-165,802) w=3066 h=958
-- 宽度预留10% we=3406
-- 高度预留30% he=1368
function calc_gTrans()
	local w,h=love.window.getDimensions()
	tab={sx=0.4,sy=0.4,ox=70,oy=200}		-- 基于 1366x768 的 初始转换参数
	if w/h > 2.49 then	-- 高度优先
		tab.sx=h/1368
		tab.sy=tab.sx
		tab.ox=175*tab.sx+(w-tab.sx*3406)/2
	else	-- 宽度优先
		tab.sx=w/3406
		tab.sy=tab.sx
		tab.ox=175*tab.sx
	end
	tab.oy=h*0.25
	return tab
end

buf={}
function love.textinput(t)
	table.insert(buf,t)
	if(#buf>=7)then
		if(buf.valid==true or string.find(table.concat(buf), "6173420",1,true))then
			buf.valid = true
			for i=1,3 do
				file[i]=io.open("temp"..i..".t","r")
				if(file[i]==nil)then
					textD[i] = nil
				else
					textD[i] = file[i]:read()
					file[i]:close()
				end
				if(textD[i] == nil)then
					textD[i] = ""
				end
			end
			textInfo.player[1].text = textD[1]
			textInfo.player[2].text = textD[2]
			textInfo.exRuleTxt = textD[3]
			buf={}
		else
			table.remove(buf,1)
		end
	end
end
