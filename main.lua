

local socket=require("socket.core")
local m=require("math")

map=require("imageMap")
bitmap=require("bitmap")
debugU=require("debugInfo")
usb=require("usbParse")
disp=require("display")
cursor=require("cursor")

hid=require("hid")

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

function sleep(sec)
	socket.select(nil,nil,sec)
end

function love.load(arg)
	fWeight=12
	FPS=0		-- 帧率
	CPS=0		-- 每秒通信次数
	debugO1=debugU.new();
	debugO1:setFont("consola.ttf",18)
	love.graphics.setFont(love.graphics.newFont("consola.ttf",fWeight));
	-- debugU.setFont("consola.ttf",fWeight);
	hid_inv=0	-- 间隔上次hid操作的时间
	usb_inv=0	-- 间隔上次usb成功通信的时间
	usbc_inv=0	-- 上次usb成功通信的时间
	love.mouse.setVisible(false)
	cursor1=cursor.new("cursor.png")
	cursor1:setOffset(20,20)
	cursorAngel=0
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
	love.timer.sleep(0.01)
end

function love.draw(dt)
	debugO1:clr()
	-- love.graphics.draw(bitmap.pBwhite, 100, 100)

	love.graphics.push()
	love.graphics.translate(70, 200)
	love.graphics.scale(0.4, 0.4)
	disp.drawBack()
	disp.drawClockUI(hid_data.buf)
	love.graphics.pop()

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

	debugO1:output()

	cursorAngel=cursorAngel-1>0 and cursorAngel-1 or 360
	cursor1:draw(cursorAngel)
end

function love.keypressed( key, isrepeat )
	if key=="escape" then
		love.event.quit()
	end
end

function love.resize(newWidth,newHeight)
end
