
local love=love
module(...)

local newImage=love.graphics.newImage

rootPath="pic/"
sPath=rootPath.."numsmall/"
lPath=rootPath.."numlarge/"
hmsPath=rootPath.."hms/"


pBbackground=newImage(rootPath.."bgEx.png")

pBalm=newImage(rootPath.."alarm.png")
pBbat=newImage(rootPath.."battery.png")
pBblack=newImage(rootPath.."black.png")
pBwhite=newImage(rootPath.."white.png")
pBbonus=newImage(rootPath.."bonus.png")
pBbyo_yomi=newImage(rootPath.."byo-yomi.png")
pBdelay=newImage(rootPath.."delay.png")
pBrestrict=newImage(rootPath.."restrict.png")
pBright=newImage(rootPath.."right.png")
pBleft=newImage(rootPath.."left.png")
pBpause=newImage(rootPath.."pause.png")
pBplus=newImage(rootPath.."plus.png")
pBlamp=newImage(rootPath.."lamp.png")
pBflag=newImage(rootPath.."flag.png")
pBdice=newImage(rootPath.."dice.png")
pBchess_dot=newImage(rootPath.."chess-dot.png")
pBchess_bottom=newImage(rootPath.."chess-bottom.png")

-- pBk_up=newImage(rootPath.."button_up.png")
-- pBk_down=newImage(rootPath.."button_down.png")
-- pBled_on=newImage(rootPath.."light_on2.png")
-- pBled_off=newImage(rootPath.."light_off2.png")


-- pBleftb=newImage(rootPath.."leftb.png")
-- pBrightb=newImage(rootPath.."rightb.png")
-- pBmiddleb=newImage(rootPath.."middleb.png")

pBcolon=newImage(hmsPath.."colon.png")
pBdot=newImage(hmsPath.."dot.png")
pBh=newImage(hmsPath.."h.png")
pBm=newImage(hmsPath.."m.png")
pBs=newImage(hmsPath.."s.png")

pBa2=newImage(sPath.."a2.png")
pBb2=newImage(sPath.."b2.png")
pBc2=newImage(sPath.."c2.png")
pBd2=newImage(sPath.."d2.png")
pBe2=newImage(sPath.."e2.png")
pBf2=newImage(sPath.."f2.png")
pBg2=newImage(sPath.."g2.png")
pBsdot=newImage(sPath.."small-dot.png")

pBa1=newImage(lPath.."a1.png")
pBb1=newImage(lPath.."b1.png")
pBc1=newImage(lPath.."c1.png")
pBb1c1=newImage(lPath.."b1c1.png")
pBd1=newImage(lPath.."d1.png")
pBe1=newImage(lPath.."e1.png")
pBf1=newImage(lPath.."f1.png")
pBg1=newImage(lPath.."g1.png")
pBbdot=newImage(lPath.."big-dot.png")
pBbdot2=newImage(lPath.."big-dot-2.png")

