
module(..., package.seeall)


function new(image)
	return {
		image=love.graphics.newImage(image);
		setOffset=function( self,x,y )self.ox=x;self.oy=y;end;
		draw=function(self,angel)love.graphics.draw(self.image, love.mouse.getX(), love.mouse.getY(), math.rad(angel),1,1,self.ox,self.oy);end;
	}
end
