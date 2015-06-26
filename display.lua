
module(...,package.seeall)


function hsb2rgb(hue,sat,bri)
	hi=math.floor(math.fmod(hue/60,6))
	f=hue/60-hi
	p=bri*(1-sat)
	q=bri*(1-f*sat)
	t=bri*(1-(1-f)*sat)
	if (hi==0) then
		r=bri;g=t;b=p
	end
	if (hi==1) then
		r=q;g=bri;b=p
	end
	if (hi==2) then
		r=p;g=bri;b=t
	end
	if (hi==3) then
		r=p;g=q;b=bri
	end
	if (hi==4) then
		r=t;g=p;b=bri
	end
	if (hi==5) then
		r=bri;g=p;b=q
	end
	r=math.floor(r)
	g=math.floor(g)
	b=math.floor(b)
	return {R=r,G=g,B=b}
end


function drawClockUI_All()
	for j=1,32 do
		for i=0,7 do
			if usb.bits[j][i].image and usb.bits[j][i].pos then
				love.graphics.draw(usb.bits[j][i].image, usb.bits[j][i].pos.x, usb.bits[j][i].pos.y)
			end
		end
	end
end


local hue=190
local color=hsb2rgb(hue,0.9,250)
local statu=0
function drawClockUI(tab)
	if tab==nil then
		return
	end
	-- color=hsb2rgb(hue,0.9,250)
	-- hue=hue+0.25
	-- if(hue>359)then
	-- 	hue=0
	-- end
	-- love.graphics.setColor(color.R,color.G,color.B,255);
	for j=1,31 do
		-- debugU.write(bit.band(3,1))
		for i=0,7 do
			if tab[j+8]~=nil and bit.band(tab[j+8],bit.lshift(1,i))>0 and usb.bits[j][i].image and usb.bits[j][i].pos then
				love.graphics.draw(usb.bits[j][i].image, usb.bits[j][i].pos.x, usb.bits[j][i].pos.y)
			end
		end
	end
end

function drawBack()
	-- love.graphics.setColor(color.R,color.G,color.B,255);
	love.graphics.draw(bitmap.pBbackground, 1, 1)
end

function drawSwitch(tab)
	if tab[9]==nil then
		return
	end
	-- love.graphics.setColor(color.R,color.G,color.B,255);
	love.graphics.draw(bitmap.pBswitch,map.offset.switch.x, map.offset.switch.y,map.offset.switch.r,1,1,map.offset.switch.ox,map.offset.switch.oy);
end

function drawSwitchMask(tab)
	if tab[9]==nil then
		return
	end
	love.graphics.setColor(backgroundColor,255);
	love.graphics.rectangle("fill",0,-10,bitmap.pBswitch:getWidth(),150)
	-- love.graphics.draw(bitmap.pBswitch,map.offset.switch.x, map.offset.switch.y,map.offset.switch.r,1,1,map.offset.switch.ox,map.offset.switch.oy);
end
