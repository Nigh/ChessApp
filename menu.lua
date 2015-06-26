
module(..., package.seeall)

icons = {}

menu={ox = (love.window.getWidth()-358)/2,oy = -60,id = nil,statu = "hide"}

local tween = require("tween")
function update(dt)
	hitTest(love.mouse.getX(),love.mouse.getY())
	tween.update(dt)
	if menu.statu == "show" then
		menu.timeout = menu.timeout + dt
	end
	if menu.timeout > 3 then
		menuHide()
	end
end

function draw()
	-- menu.ox = (love.window.getWidth()-358)/2
	menu.ox = (love.window.getWidth()-185)
	love.graphics.push()
	love.graphics.translate(menu.ox, menu.oy)
	drawBackground()
	drawIcon()
	love.graphics.pop()
end

hoverObj=nil
function onMouseHover(id)
	if id == hoverObj then
		return
	end
	id.statu = id.colors.hover
	hoverObj = id
end

function onMouseLeave()
	hoverObj.statu = hoverObj.colors.normal
	hoverObj=nil
end

mouseDownObj=nil
function onMouseDown()
	if hoverObj then
		mouseDownObj = hoverObj
		mouseDownObj.statu=mouseDownObj.colors.pressed
	end
end

function onMouseRelease()
	if hoverObj and hoverObj == mouseDownObj then
		hoverObj.func()
	end
	mouseDownObj=nil
end

function hitTest(x,y)
	x = x - menu.ox
	y = y - menu.oy

	if hoverObj and (x<hoverObj.pos.x or x>hoverObj.pos.x+hoverObj.pos.w
		or y<hoverObj.pos.y or y>hoverObj.pos.y+hoverObj.pos.h) then
		onMouseLeave()
	end

	for i=1,#icons do
		if x>icons[i].pos.x and x<icons[i].pos.x+icons[i].pos.w
			and y>icons[i].pos.y and y<icons[i].pos.y+icons[i].pos.h then
			onMouseHover(icons[i])
			break
		end
	end
end

function onMouseMove(x,y)
	menuShow()
	menu.timeout = 0
end

function onMouseClick()

end

local bgPoly={0,0,50,50,300,50,350,0}
local bgPoly2={-8,0,45,53,305,53,358,0}
local bgPoly3={0,0,0,30,20,50,65,50,65,0}
function drawBackground()
	-- love.graphics.setColor(102,179,255,100)
	-- love.graphics.polygon("fill",bgPoly2)
	love.graphics.setColor(102,233,179,240)
	love.graphics.polygon("fill",bgPoly3)
	-- love.graphics.rectangle("fill", 5, 0, 60, 50)
	love.graphics.setColor(109,102,233,240)
	love.graphics.rectangle("fill", 65, 0, 60, 50)
	love.graphics.setColor(233,102,109,240)
	love.graphics.rectangle("fill", 125, 0, 60, 50)
	-- love.graphics.polygon("fill",bgPoly)
end

-- 将statu置为nil可阻止绘制
function drawIcon()
	for i=1,#icons do
		if icons[i].statu and icons[i].pos.x then
			love.graphics.setColor(icons[i].statu)
			love.graphics.draw(icons[i].image, icons[i].pos.x, icons[i].pos.y, icons[i].pos.r or 0)
		end
	end
end

function menuShow()
	if menu.statu~="show" and menu.statu~="showing" then
		menu.statu = "showing"
		tween.stop(menu.id)
		menu.id = tween(2, menu, {oy = 0}, "outBack",function()menu.statu = "show";end)
	end
end

function menuHide()
	if menu.statu and menu.statu~="hide" and menu.statu~="hiding" then
		menu.statu = "hiding"
		tween.stop(menu.id)
		menu.id = tween(2, menu, {oy = -60}, "inQuad",function()menu.statu = nil;end)
	end
end



function setPos(self,x,y)
	self.pos.x=x
	self.pos.y=y
	return self
end

-- colors={normal={r,g,b,a},hover={r,g,b,a},pressed={r,g,b,a},disabled={r,g,b,a}}
function icons:new(image,colors)
	table.insert(self,{image=love.graphics.newImage(image),colors=colors,statu=nil,pos={},setPos=setPos})
	self[#self].pos={w=self[#self].image:getWidth(),h=self[#self].image:getHeight()}
	self[#self].statu=self[#self].colors.normal
	return self[#self]
end

