
module(..., package.seeall)
local tween = require("tween")
local message = {text = "",id = nil,scale = 0.1,alpha = 250}
local font_h = 140;
local font = love.graphics.newFont("impact.ttf",font_h);

function msg(msg,func)
	if message.id then tween.resetAll() end
	message = {text = msg,id = nil,scale = 0.1,alpha = 250}
	message.id = tween(4, message, {scale = 1}, "outElastic",func)
end

function del( )
	message.text = nil
end

function fadeOut()
	message.id = nil
	message.id = tween(3, message, {alpha=0}, "linear",del)
end


function update(dt)
	tween.update(dt)
end

function draw()
	if message.text and message.text ~= "" then
		love.graphics.push()
		love.graphics.translate(love.graphics.getWidth()*(1-message.scale)/2, (love.graphics.getHeight()-font_h*message.scale)/2)
		if message.alpha>255 then message.alpha = 255 end
		love.graphics.setColor(255,77,66,message.alpha)
		love.graphics.setFont(font)
		love.graphics.scale(message.scale, message.scale)
		love.graphics.printf(message.text,0,0,love.graphics.getWidth(),"center")
		love.graphics.pop()
	end
end
