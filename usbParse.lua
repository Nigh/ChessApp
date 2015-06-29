
-- 包含usb报文与ui显示的对应关系
-- 储存每个bit所对应的bitmap以及x,y
module(...,package.seeall)
-- local bitmap=require("bitmap")
-- local imageMap=require("imageMap")
-- package.seeall(bitmap)
-- package.seeall(imageMap)
local group=imageMap.group
local offset=imageMap.offset
local bp=bitmap

bits={}

data={}

for i=1,31 do
	bits[i]={}
	for j=0,7 do
		bits[i][j]={}
	end
end

bits[1][0].image=nil	-- left led
bits[1][1].image=nil	-- right led
bits[1][2].image=nil
bits[1][3].image=nil
bits[1][4].image=nil
bits[1][5].image=nil
bits[1][6].image=nil	-- left key
bits[1][7].image=nil	-- right key

bits[2][0].image=bp.pBchess_dot
bits[2][1].image=bp.pBchess_dot
bits[2][2].image=bp.pBchess_dot
bits[2][3].image=bp.pBbyo_yomi
bits[2][4].image=bp.pBrestrict
bits[2][5].image=bp.pBdelay
bits[2][6].image=bp.pBbonus
bits[2][7].image=nil

bits[3][0].image=bp.pBchess_dot
bits[3][1].image=bp.pBchess_dot
bits[3][2].image=bp.pBchess_dot
bits[3][3].image=bp.pBchess_dot
bits[3][4].image=bp.pBd2
bits[3][5].image=bp.pBe2
bits[3][6].image=bp.pBf2
bits[3][7].image=bp.pBa2

bits[4][0].image=bp.pBchess_bottom
bits[4][1].image=bp.pBchess_dot
bits[4][2].image=bp.pBchess_dot
bits[4][3].image=bp.pBchess_dot
bits[4][4].image=bp.pBc2
bits[4][5].image=bp.pBg2
bits[4][6].image=bp.pBb2
bits[4][7].image=bp.pBblack

bits[5][0].image=bp.pBchess_dot
bits[5][1].image=bp.pBchess_dot
bits[5][2].image=bp.pBchess_dot
bits[5][3].image=bp.pBchess_dot
bits[5][4].image=bp.pBd2
bits[5][5].image=bp.pBe2
bits[5][6].image=bp.pBf2
bits[5][7].image=bp.pBa2

bits[6][0].image=bp.pBchess_bottom
bits[6][1].image=bp.pBchess_dot
bits[6][2].image=bp.pBchess_dot
bits[6][3].image=bp.pBchess_dot
bits[6][4].image=bp.pBc2
bits[6][5].image=bp.pBg2
bits[6][6].image=bp.pBb2
bits[6][7].image=bp.pBwhite

bits[7][0].image=bp.pBchess_dot
bits[7][1].image=bp.pBchess_dot
bits[7][2].image=bp.pBchess_dot
bits[7][3].image=bp.pBchess_dot
bits[7][4].image=bp.pBd2
bits[7][5].image=bp.pBe2
bits[7][6].image=bp.pBf2
bits[7][7].image=bp.pBa2

bits[8][0].image=bp.pBchess_bottom
bits[8][1].image=bp.pBchess_dot
bits[8][2].image=bp.pBchess_dot
bits[8][3].image=bp.pBchess_dot
bits[8][4].image=bp.pBc2
bits[8][5].image=bp.pBg2
bits[8][6].image=bp.pBb2
bits[8][7].image=bp.pBbat

bits[9][0].image=bp.pBchess_dot
bits[9][1].image=bp.pBchess_dot
bits[9][2].image=bp.pBchess_dot
bits[9][3].image=bp.pBchess_dot
bits[9][4].image=bp.pBchess_dot
bits[9][5].image=bp.pBchess_dot
bits[9][6].image=bp.pBd2
bits[9][7].image=bp.pBe2

bits[10][0].image=bp.pBchess_dot
bits[10][1].image=bp.pBchess_dot
bits[10][2].image=bp.pBchess_dot
bits[10][3].image=bp.pBchess_dot
bits[10][4].image=bp.pBchess_dot
bits[10][5].image=bp.pBsdot
bits[10][6].image=bp.pBb2
bits[10][7].image=bp.pBa2

bits[11][0].image=bp.pBchess_bottom
bits[11][1].image=bp.pBchess_dot
bits[11][2].image=bp.pBchess_dot
bits[11][3].image=bp.pBchess_dot
bits[11][4].image=bp.pBc1
bits[11][5].image=bp.pBg1
bits[11][6].image=bp.pBb1
bits[11][7].image=bp.pBa1

bits[12][0].image=bp.pBcolon
bits[12][1].image=bp.pBh
bits[12][2].image=bp.pBchess_dot
bits[12][3].image=bp.pBchess_dot
bits[12][4].image=bp.pBchess_dot
bits[12][5].image=bp.pBchess_dot
bits[12][6].image=bp.pBbdot
bits[12][7].image=bp.pBbdot2

bits[13][0].image=bp.pBm
bits[13][1].image=bp.pBd1
bits[13][2].image=bp.pBe1
bits[13][3].image=bp.pBc1
bits[13][4].image=bp.pBg1
bits[13][5].image=bp.pBf1
bits[13][6].image=bp.pBb1
bits[13][7].image=bp.pBa1

bits[14][0].image=bp.pBdot
bits[14][1].image=bp.pBd1
bits[14][2].image=bp.pBe1
bits[14][3].image=bp.pBc1
bits[14][4].image=bp.pBg1
bits[14][5].image=bp.pBf1
bits[14][6].image=bp.pBb1
bits[14][7].image=bp.pBa1

bits[15][0].image=bp.pBd2
bits[15][1].image=bp.pBe2
bits[15][2].image=bp.pBc2
bits[15][3].image=bp.pBg2
bits[15][4].image=bp.pBf2
bits[15][5].image=bp.pBb2
bits[15][6].image=bp.pBa2
bits[15][7].image=bp.pBwhite

bits[16][0].image=bp.pBd2
bits[16][1].image=bp.pBe2
bits[16][2].image=bp.pBc2
bits[16][3].image=bp.pBg2
bits[16][4].image=bp.pBf2
bits[16][5].image=bp.pBb2
bits[16][6].image=bp.pBa2
bits[16][7].image=bp.pBblack

bits[17][0].image=bp.pBplus
bits[17][1].image=bp.pBflag
bits[17][2].image=bp.pBbyo_yomi
bits[17][3].image=bp.pBrestrict
bits[17][4].image=bp.pBdelay
bits[17][5].image=bp.pBbonus
bits[17][6].image=bp.pBs
bits[17][7].image=nil

bits[18][0].image=bp.pBchess_bottom
bits[18][1].image=bp.pBchess_dot
bits[18][2].image=bp.pBchess_dot
bits[18][3].image=bp.pBchess_dot
bits[18][4].image=bp.pBc2
bits[18][5].image=bp.pBg2
bits[18][6].image=bp.pBf2
bits[18][7].image=nil

bits[19][0].image=bp.pBs
bits[19][1].image=bp.pBdot
bits[19][2].image=bp.pBm
bits[19][3].image=bp.pBd1
bits[19][4].image=bp.pBe1
bits[19][5].image=bp.pBf1
bits[19][6].image=nil
bits[19][7].image=nil

bits[20][0].image=bp.pBcolon
bits[20][1].image=bp.pBh
bits[20][2].image=bp.pBplus
bits[20][3].image=bp.pBflag
bits[20][4].image=bp.pBb1c1
bits[20][5].image=nil
bits[20][6].image=nil
bits[20][7].image=nil

bits[22][0].image=bp.pBd2
bits[22][1].image=bp.pBe2
bits[22][2].image=bp.pBg2
bits[22][3].image=bp.pBf2
bits[22][4].image=bp.pBdice
bits[22][5].image=bp.pBc1
bits[22][6].image=bp.pBg1
bits[22][7].image=bp.pBa1

bits[23][0].image=bp.pBe2
bits[23][1].image=bp.pBc2
bits[23][2].image=bp.pBf2
bits[23][3].image=bp.pBb2
bits[23][4].image=bp.pBa2
bits[23][5].image=bp.pBbdot
bits[23][6].image=bp.pBbdot2
bits[23][7].image=bp.pBb1

bits[24][0].image=bp.pBd2
bits[24][1].image=bp.pBc2
bits[24][2].image=bp.pBg2
bits[24][3].image=bp.pBb2
bits[24][4].image=bp.pBa2
bits[24][5].image=bp.pBd1
bits[24][6].image=bp.pBe1
bits[24][7].image=bp.pBf1

bits[25][0].image=bp.pBd2
bits[25][1].image=bp.pBe2
bits[25][2].image=bp.pBc2
bits[25][3].image=bp.pBg2
bits[25][4].image=bp.pBf2
bits[25][5].image=bp.pBc1
bits[25][6].image=bp.pBg1
bits[25][7].image=bp.pBa1

bits[26][0].image=bp.pBchess_dot
bits[26][1].image=bp.pBchess_dot
bits[26][2].image=bp.pBb2
bits[26][3].image=bp.pBa2
bits[26][4].image=bp.pBd1
bits[26][5].image=bp.pBe1
bits[26][6].image=bp.pBf1
bits[26][7].image=bp.pBb1

bits[27][0].image=bp.pBchess_bottom
bits[27][1].image=bp.pBchess_dot
bits[27][2].image=bp.pBchess_dot
bits[27][3].image=bp.pBchess_dot
bits[27][4].image=bp.pBc1
bits[27][5].image=bp.pBg1
bits[27][6].image=bp.pBb1
bits[27][7].image=bp.pBa1

bits[28][0].image=bp.pBchess_bottom
bits[28][1].image=bp.pBchess_dot
bits[28][2].image=bp.pBchess_dot
bits[28][3].image=bp.pBchess_dot
bits[28][4].image=bp.pBchess_dot
bits[28][5].image=bp.pBd2
bits[28][6].image=bp.pBe2
bits[28][7].image=bp.pBleft

bits[29][0].image=bp.pBchess_dot
bits[29][1].image=bp.pBchess_dot
bits[29][2].image=bp.pBchess_dot
bits[29][3].image=bp.pBc2
bits[29][4].image=bp.pBg2
bits[29][5].image=bp.pBf2
bits[29][6].image=bp.pBpause
bits[29][7].image=bp.pBalm

bits[30][0].image=bp.pBchess_bottom
bits[30][1].image=bp.pBchess_dot
bits[30][2].image=bp.pBchess_dot
bits[30][3].image=bp.pBchess_dot
bits[30][4].image=bp.pBb2
bits[30][5].image=bp.pBa2
bits[30][6].image=bp.pBright
bits[30][7].image=bp.pBlamp

bits[31][0].image=bp.pBchess_dot
bits[31][1].image=bp.pBchess_dot
bits[31][2].image=bp.pBchess_dot
bits[31][3].image=bp.pBchess_dot
bits[31][4].image=bp.pBd1
bits[31][5].image=bp.pBe1
bits[31][6].image=bp.pBb1c1
bits[31][7].image=bp.pBf1

-- -----------------------------------------------------------
-- -----------------------------------------------------------
-- -----------------------------------------------------------
-- -----------------------------------------------------------
function getPos( groupN,member,relative )
	local x=group[groupN].x+group[groupN].offset[member].x
	local y=group[groupN].y+group[groupN].offset[member].y
	if relative then
		x=x+relative.x
		y=y+relative.y
	end
	return {x=x, y=y}
end

function getChess960( groupN, dotn )
	local x=group[6].x+group[6].offset.s1.x+147*(groupN-1)+math.fmod(dotn, 3)*40
	local y=group[6].y+group[6].offset.s1.y
	if dotn>=6 then
		y=y-34
	else
		if dotn>=3 then
			y=y-73
		else
			if dotn>=1 then
				y=y-112
			end
		end
	end
	return {x=x, y=y}
end

local getC=getChess960
local getP=getPos

-- loc\[(\d+),(\d+)\]:=getloc\("group(\d)",(".+?")(.+)?\)
-- bits[$1][$2].pos=getP($3,$4$5)

-- loc\[(\d+),(\d+)\]:=getChess960\((\d+),(\d+)\)
-- bits[$1][$2].pos=getC($3,$4)

-- smallnum\["(\w)"\]
-- offset.S_Num.$1

-- largenum\["(\w)"\]
-- offset.L_Num.$1

bits[1][0].pos=nil
bits[1][1].pos=nil
bits[1][2].pos=nil
bits[1][3].pos=nil
bits[1][4].pos={x=145-154, y=586-850}
bits[1][5].pos={x=145-154, y=586-850}
bits[1][6].pos={x=36-154, y=333-850}
bits[1][7].pos={x=1860-154, y=333-850}

bits[2][0].pos=getC(1,8)
bits[2][1].pos=getC(1,5)
bits[2][2].pos=getC(1,2)
bits[2][3].pos=getP(1,"byo_yomi")
bits[2][4].pos=getP(1,"restrict")
bits[2][5].pos=getP(1,"delay")
bits[2][6].pos=getP(1,"bonus")
bits[2][7].pos=nil

bits[3][0].pos=getC(2,7)
bits[3][1].pos=getC(2,6)
bits[3][2].pos=getC(2,4)
bits[3][3].pos=getC(2,3)
bits[3][4].pos=getP(1,"lcd5",offset.S_Num.d)
bits[3][5].pos=getP(1,"lcd5",offset.S_Num.e)
bits[3][6].pos=getP(1,"lcd5",offset.S_Num.f)
bits[3][7].pos=getP(1,"lcd5",offset.S_Num.a)


bits[4][0].pos=getC(2,0)
bits[4][1].pos=getC(2,8)
bits[4][2].pos=getC(2,5)
bits[4][3].pos=getC(2,1)
bits[4][4].pos=getP(1,"lcd5",offset.S_Num.c)
bits[4][5].pos=getP(1,"lcd5",offset.S_Num.g)
bits[4][6].pos=getP(1,"lcd5",offset.S_Num.b)
bits[4][7].pos=getP(1,"black")



bits[5][0].pos=getC(3,7)
bits[5][1].pos=getC(3,6)
bits[5][2].pos=getC(3,3)
bits[5][3].pos=getC(2,2)
bits[5][4].pos=getP(1,"lcd6",offset.S_Num.d)
bits[5][5].pos=getP(1,"lcd6",offset.S_Num.e)
bits[5][6].pos=getP(1,"lcd6",offset.S_Num.f)
bits[5][7].pos=getP(1,"lcd6",offset.S_Num.a)


bits[6][0].pos=getC(3,0)
bits[6][1].pos=getC(3,8)
bits[6][2].pos=getC(3,4)
bits[6][3].pos=getC(3,5)
bits[6][4].pos=getP(1,"lcd6",offset.S_Num.c)
bits[6][5].pos=getP(1,"lcd6",offset.S_Num.g)
bits[6][6].pos=getP(1,"lcd6",offset.S_Num.b)
bits[6][7].pos=getP(1,"white")


bits[7][0].pos=getC(4,7)
bits[7][1].pos=getC(4,6)
bits[7][2].pos=getC(3,2)
bits[7][3].pos=getC(3,1)
bits[7][4].pos=getP(3,"lcd1",offset.S_Num.d)
bits[7][5].pos=getP(3,"lcd1",offset.S_Num.e)
bits[7][6].pos=getP(3,"lcd1",offset.S_Num.f)
bits[7][7].pos=getP(3,"lcd1",offset.S_Num.a)


bits[8][0].pos=getC(4,0)
bits[8][1].pos=getC(4,8)
bits[8][2].pos=getC(4,4)
bits[8][3].pos=getC(4,3)
bits[8][4].pos=getP(3,"lcd1",offset.S_Num.c)
bits[8][5].pos=getP(3,"lcd1",offset.S_Num.g)
bits[8][6].pos=getP(3,"lcd1",offset.S_Num.b)
bits[8][7].pos=getP(3,"bat")


bits[9][0].pos=getC(5,7)
bits[9][1].pos=getC(5,6)
bits[9][2].pos=getC(5,3)
bits[9][3].pos=getC(4,5)
bits[9][4].pos=getC(4,1)
bits[9][5].pos=getC(4,2)
bits[9][6].pos=getP(3,"lcd2",offset.S_Num.d)
bits[9][7].pos=getP(3,"lcd2",offset.S_Num.e)



bits[10][0].pos=getC(6,7)
bits[10][1].pos=getC(6,6)
bits[10][2].pos=getC(6,3)
bits[10][3].pos=getC(5,2)
bits[10][4].pos=getC(5,1)
bits[10][5].pos=getP(3,"dot")
bits[10][6].pos=getP(3,"lcd2",offset.S_Num.b)
bits[10][7].pos=getP(3,"lcd2",offset.S_Num.a)


bits[11][0].pos=getC(8,0)
bits[11][1].pos=getC(8,7)
bits[11][2].pos=getC(8,4)
bits[11][3].pos=getC(7,2)
bits[11][4].pos=getP(2,"lcd2",offset.L_Num.c)
bits[11][5].pos=getP(2,"lcd2",offset.L_Num.g)
bits[11][6].pos=getP(2,"lcd2",offset.L_Num.b)
bits[11][7].pos=getP(2,"lcd2",offset.L_Num.a)


bits[12][0].pos=getP(5,"colon")
bits[12][1].pos=getP(5,"h")
bits[12][2].pos=getC(8,8)
bits[12][3].pos=getC(8,5)
bits[12][4].pos=getC(8,2)
bits[12][5].pos=getC(8,1)
bits[12][6].pos=getP(2,"dot2")
bits[12][7].pos=getP(2,"dot0")

bits[13][0].pos=getP(5,"m")
bits[13][1].pos=getP(2,"lcd3",offset.L_Num.d)
bits[13][2].pos=getP(2,"lcd3",offset.L_Num.e)
bits[13][3].pos=getP(2,"lcd3",offset.L_Num.c)
bits[13][4].pos=getP(2,"lcd3",offset.L_Num.g)
bits[13][5].pos=getP(2,"lcd3",offset.L_Num.f)
bits[13][6].pos=getP(2,"lcd3",offset.L_Num.b)
bits[13][7].pos=getP(2,"lcd3",offset.L_Num.a)

bits[14][0].pos=getP(5,"dot")
bits[14][1].pos=getP(2,"lcd4",offset.L_Num.d)
bits[14][2].pos=getP(2,"lcd4",offset.L_Num.e)
bits[14][3].pos=getP(2,"lcd4",offset.L_Num.c)
bits[14][4].pos=getP(2,"lcd4",offset.L_Num.g)
bits[14][5].pos=getP(2,"lcd4",offset.L_Num.f)
bits[14][6].pos=getP(2,"lcd4",offset.L_Num.b)
bits[14][7].pos=getP(2,"lcd4",offset.L_Num.a)

bits[15][0].pos=getP(2,"lcd5",offset.S_Num.d)
bits[15][1].pos=getP(2,"lcd5",offset.S_Num.e)
bits[15][2].pos=getP(2,"lcd5",offset.S_Num.c)
bits[15][3].pos=getP(2,"lcd5",offset.S_Num.g)
bits[15][4].pos=getP(2,"lcd5",offset.S_Num.f)
bits[15][5].pos=getP(2,"lcd5",offset.S_Num.b)
bits[15][6].pos=getP(2,"lcd5",offset.S_Num.a)
bits[15][7].pos=getP(2,"white")

bits[16][0].pos=getP(2,"lcd6",offset.S_Num.d)
bits[16][1].pos=getP(2,"lcd6",offset.S_Num.e)
bits[16][2].pos=getP(2,"lcd6",offset.S_Num.c)
bits[16][3].pos=getP(2,"lcd6",offset.S_Num.g)
bits[16][4].pos=getP(2,"lcd6",offset.S_Num.f)
bits[16][5].pos=getP(2,"lcd6",offset.S_Num.b)
bits[16][6].pos=getP(2,"lcd6",offset.S_Num.a)
bits[16][7].pos=getP(2,"black")

bits[17][0].pos=getP(5,"plus")
bits[17][1].pos=getP(5,"flag")
bits[17][2].pos=getP(2,"byo_yomi")
bits[17][3].pos=getP(2,"restrict")
bits[17][4].pos=getP(2,"delay")
bits[17][5].pos=getP(2,"bonus")
bits[17][6].pos=getP(5,"s")
bits[17][7].pos=nil



bits[18][0].pos=getC(5,0)
bits[18][1].pos=getC(5,8)
bits[18][2].pos=getC(5,4)
bits[18][3].pos=getC(5,5)
bits[18][4].pos=getP(3,"lcd2",offset.S_Num.c)
bits[18][5].pos=getP(3,"lcd2",offset.S_Num.g)
bits[18][6].pos=getP(3,"lcd2",offset.S_Num.f)
bits[18][7].pos=nil

bits[19][0].pos=getP(4,"s")
bits[19][1].pos=getP(4,"dot")
bits[19][2].pos=getP(4,"m")
bits[19][3].pos=getP(1,"lcd2",offset.L_Num.d)
bits[19][4].pos=getP(1,"lcd2",offset.L_Num.e)
bits[19][5].pos=getP(1,"lcd2",offset.L_Num.f)
bits[19][6].pos=nil
bits[19][7].pos=nil

bits[20][0].pos=getP(4,"colon")
bits[20][1].pos=getP(4,"h")
bits[20][2].pos=getP(4,"plus")
bits[20][3].pos=getP(4,"flag")
bits[20][4].pos=getP(1,"lcd1",offset.L_Num.b)
bits[20][5].pos=nil
bits[20][6].pos=nil
bits[20][7].pos=nil

bits[22][0].pos=getP(6,"lcd1",offset.S_Num.d)
bits[22][1].pos=getP(6,"lcd1",offset.S_Num.e)
bits[22][2].pos=getP(6,"lcd1",offset.S_Num.g)
bits[22][3].pos=getP(6,"lcd1",offset.S_Num.f)
bits[22][4].pos=getP(6,"dice")
bits[22][5].pos=getP(1,"lcd2",offset.L_Num.c)
bits[22][6].pos=getP(1,"lcd2",offset.L_Num.g)
bits[22][7].pos=getP(1,"lcd2",offset.L_Num.a)

bits[23][0].pos=getP(6,"lcd2",offset.S_Num.e)
bits[23][1].pos=getP(6,"lcd1",offset.S_Num.c)
bits[23][2].pos=getP(6,"lcd2",offset.S_Num.f)
bits[23][3].pos=getP(6,"lcd1",offset.S_Num.b)
bits[23][4].pos=getP(6,"lcd1",offset.S_Num.a)
bits[23][5].pos=getP(1,"dot2")
bits[23][6].pos=getP(1,"dot0")
bits[23][7].pos=getP(1,"lcd2",offset.L_Num.b)

bits[24][0].pos=getP(6,"lcd2",offset.S_Num.d)
bits[24][1].pos=getP(6,"lcd2",offset.S_Num.c)
bits[24][2].pos=getP(6,"lcd2",offset.S_Num.g)
bits[24][3].pos=getP(6,"lcd2",offset.S_Num.b)
bits[24][4].pos=getP(6,"lcd2",offset.S_Num.a)
bits[24][5].pos=getP(1,"lcd3",offset.L_Num.d)
bits[24][6].pos=getP(1,"lcd3",offset.L_Num.e)
bits[24][7].pos=getP(1,"lcd3",offset.L_Num.f)

bits[25][0].pos=getP(6,"lcd3",offset.S_Num.d)
bits[25][1].pos=getP(6,"lcd3",offset.S_Num.e)
bits[25][2].pos=getP(6,"lcd3",offset.S_Num.c)
bits[25][3].pos=getP(6,"lcd3",offset.S_Num.g)
bits[25][4].pos=getP(6,"lcd3",offset.S_Num.f)
bits[25][5].pos=getP(1,"lcd3",offset.L_Num.c)
bits[25][6].pos=getP(1,"lcd3",offset.L_Num.g)
bits[25][7].pos=getP(1,"lcd3",offset.L_Num.a)


bits[26][0].pos=getC(1,6)
bits[26][1].pos=getC(1,3)
bits[26][2].pos=getP(6,"lcd3",offset.S_Num.b)
bits[26][3].pos=getP(6,"lcd3",offset.S_Num.a)
bits[26][4].pos=getP(1,"lcd4",offset.L_Num.d)
bits[26][5].pos=getP(1,"lcd4",offset.L_Num.e)
bits[26][6].pos=getP(1,"lcd4",offset.L_Num.f)
bits[26][7].pos=getP(1,"lcd3",offset.L_Num.b)


bits[27][0].pos=getC(1,0)
bits[27][1].pos=getC(1,7)
bits[27][2].pos=getC(1,4)
bits[27][3].pos=getC(1,1)
bits[27][4].pos=getP(1,"lcd4",offset.L_Num.c)
bits[27][5].pos=getP(1,"lcd4",offset.L_Num.g)
bits[27][6].pos=getP(1,"lcd4",offset.L_Num.b)
bits[27][7].pos=getP(1,"lcd4",offset.L_Num.a)

bits[28][0].pos=getC(6,0)
bits[28][1].pos=getC(6,8)
bits[28][2].pos=getC(6,4)
bits[28][3].pos=getC(6,5)
bits[28][4].pos=getC(6,1)
bits[28][5].pos=getP(3,"lcd3",offset.S_Num.d)
bits[28][6].pos=getP(3,"lcd3",offset.S_Num.e)
bits[28][7].pos=getP(3,"left")


bits[29][0].pos=getC(7,7)
bits[29][1].pos=getC(7,6)
bits[29][2].pos=getC(6,2)
bits[29][3].pos=getP(3,"lcd3",offset.S_Num.c)
bits[29][4].pos=getP(3,"lcd3",offset.S_Num.g)
bits[29][5].pos=getP(3,"lcd3",offset.S_Num.f)
bits[29][6].pos=getP(3,"pause")
bits[29][7].pos=getP(3,"alm")


bits[30][0].pos=getC(7,0)
bits[30][1].pos=getC(7,8)
bits[30][2].pos=getC(7,4)
bits[30][3].pos=getC(7,3)
bits[30][4].pos=getP(3,"lcd3",offset.S_Num.b)
bits[30][5].pos=getP(3,"lcd3",offset.S_Num.a)
bits[30][6].pos=getP(3,"right")
bits[30][7].pos=getP(3,"lamp")


bits[31][0].pos=getC(8,6)
bits[31][1].pos=getC(8,3)
bits[31][2].pos=getC(7,5)
bits[31][3].pos=getC(7,1)
bits[31][4].pos=getP(2,"lcd2",offset.L_Num.d)
bits[31][5].pos=getP(2,"lcd2",offset.L_Num.e)
bits[31][6].pos=getP(2,"lcd1",offset.L_Num.b)
bits[31][7].pos=getP(2,"lcd2",offset.L_Num.f)

