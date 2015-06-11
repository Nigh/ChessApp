
module(..., package.seeall)

local drops={}
local tweens=require("tween")

function newDrop(x,y,maxR)
	local newDrop={x=x,y=y,r=1,alpha=255,id=nil}
	newDrop.id=tweens(math.random(maxR/180,maxR/150), newDrop, {r = maxR, alpha = 0}, "outSine")
	table.insert(drops,newDrop)
end

function update(dt)
	tweens.update(dt)

end

function draw()
	for i=1,#drops do
		love.graphics.setColor(255,255,255,drops[i].alpha)
		love.graphics.circle("line", drops[i].x, drops[i].y, drops[i].r, 64)
	end
	for i=#drops,1,-1 do
		if drops[i].alpha==0 then
			table.remove(drops,i)
		end
	end
end
