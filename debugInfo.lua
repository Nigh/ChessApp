
-- local love=love
-- local table=table
module(...,package.seeall)

function new(...)
	local tab=
	{
		text={};
		color={211,222,222,200};
		fweight=12;
		font=love.graphics.getFont();
		setFont=function(self,f,weight)
			self.fweight=weight;
			self.font=love.graphics.newFont(f,weight);
		end;
		setColor=function(self,r,g,b,a)
		self.color={r,g,b,a};
		end;
		write=function(self,...)
			var={...}
			if not (string.find(type(var[1]),"number")
			or string.find(type(var[1]),"string")
			or string.find(type(var[1]),"boolean"))
			then
				var[1]=type(var[1])
				table.insert(self.text,var[1])
				return
			end
			if not (string.find(type(var[2]),"number")
			or string.find(type(var[2]),"string")
			or string.find(type(var[2]),"boolean"))
			then
				table.insert(self.text,var[1])
			else
				self.text[var[1]]=var[2]
			end
		end;
		output=function(self,mode)
			love.graphics.setFont(self.font);
			love.graphics.setColor(self.color);
			dy=5
			for k,v in pairs(self.text) do
				love.graphics.printf(k..":"..v,5,dy,1)
				iter=string.gfind(v,"\n")
				while iter() do
					dy=dy+self.fweight
				end
				dy=dy+self.fweight
			end
		end;
		clr=function(self)
			self.text=nil
			self.text={}
		end;
	}
	if ... then for k,v in pairs(...) do
		tab[k]=v
	end end
	return tab
end
