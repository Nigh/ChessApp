
module(..., package.seeall)

player={{_},{_}}
Info={}

font=nil

player[1].text="No.001"
player[2].text="No.002"
exRuleTxt=""
-- player[1].text="村上春树"
-- player[2].text="芭蕉桑"

rulesTxt={
--[[1]] {txt="Time blitz",time="[ 3M ]"},
--[[2]] {txt="Time blitz",time="[ 5M ]"},
--[[3]] {txt="Time blitz",time="[ 10M ]"},
--[[4]] {txt="Time rapid",time="[ 15M ]"},
--[[5]] {txt="Time rapid",time="[ 20M ]"},
--[[6]] {txt="Time rapid",time="[ 25M ]"},
--[[7]] {txt="Time rapid",time="[ 30M ]"},
--[[8]] {txt="Time rapid",time="[ 45M ]"},
--[[9]] {txt="Time rapid",time="[ 60M ]"},
--[[10]]{txt="Time rapid",time="[ 90M ]"},
--[[11]]{txt="Time rapid",time="[ 120M ]"},
--[[12]]{txt="Time",time="[ manual set ]"},
--[[13]]{txt="Time + guillotine",time="[ 2H f.b.30M ]"},
--[[14]]{txt="Time + guillotine",time="[ manual set ]"},
--[[15]]{txt="2 x Time + guillotine",time="[ 2H f.b.1H f.b.30M ]"},
--[[16]]{txt="2 x Time + guillotine",time="[ manual set ]"},
--[[17]]{txt="Time + time repeating 2nd period",time="[ 2H f.b.1H(repeating) ]"},
--[[18]]{txt="Time + time repeating 2nd period",time="[ manual set ]"},
--[[19]]{txt="Time + Bonus  (\"Fischer\")",time="[ 25M f.b.5M+10S/move ]"},
--[[20]]{txt="Time + Bonus  (\"Fischer\")",time="[ 2H f.b.15M+30S/move ]"},
--[[21]]{txt="Time + Bonus  (\"Fischer\")",time="[ manual set ]"},
--[[22]]{txt="2 x Time + Bonus  (\"Fischer\")",time="[ 2H f.b.1H f.b.15M+30S/move ]"},
--[[23]]{txt="2 x Time + Bonus  (\"Fischer\")",time="[ manual set ]"},
--[[24]]{txt="Bonus  (\"Fischer\")  blitz",time="[ 3M+2S/move ]"},
--[[25]]{txt="Bonus  (\"Fischer\")  rapid",time="[ 15M+10S/move ]"},
--[[26]]{txt="Bonus  (\"Fischer\")  rapid",time="[ 25M+10S/move ]"},
--[[27]]{txt="Bonus  (\"Fischer\")  slow",time="[ 1H30M+30S/move ]"},
--[[28]]{txt="Bonus  (\"Fischer\")",time="[ manual set ]"},
--[[29]]{txt="Bonus tournament",time="[ 1H40M f.b.30M (all+30S/move) ]"},
--[[30]]{txt="Bonus tournament",time="[ 1H40M f.b.50M f.b.15M (all+30S/move) ]"},
--[[31]]{txt="Bonus tournament    Max 4 periods",time="[ manual set(with/without move counter) ]"},
--[[32]]{txt="Delay \"Bronstein\" Blitz",time="[ 5M+3S/move free ]"},
--[[33]]{txt="Delay \"Bronstein\" Rapid",time="[ 25M+10S/move free ]"},
--[[34]]{txt="Delay \"Bronstein\" Slow",time="[ 1H55M+5S/move free ]"},
--[[35]]{txt="Delay \"Bronstein\" max 4 periods",time="[ manual set individual delay for each period ]"},
--[[36]]{txt="Go with byo-yomi",time="[ 1H f.b.1x20S byo-yomi ]"},
--[[37]]{txt="Go with byo-yomi",time="[ 2H f.b.1x30S byo-yomi ]"},
--[[38]]{txt="Go with byo-yomi",time="[ manual set ]"},
--[[39]]{txt="Canadian byo-yomi",time="[ 1H f.b.5M overtime ]"},
--[[40]]{txt="Canadian byo-yomi",time="[ manual set (with or without move counter) ]"},
--[[41]]{txt="Hour Glass",time="[ 1M ]"},
--[[42]]{txt="Hour Glass",time="[ manual set ]"},
--[[43]]{txt="Gong",time="[ 10S ]"},
--[[44]]{txt="Gong",time="[ manual set ]"},
--[[45]]{txt="Descending Time",time="[ 10S/move ]"},
--[[46]]{txt="Descending Time",time="[ 1M/move ]"},
--[[47]]{txt="Descending Time",time="[ manual set ]"},
--[[48]]{txt="Time Delay",time="[ 5M+2S/move free ]"},
--[[49]]{txt="Time Delay",time="[ manual set ]"},
--[[50]]{txt="2 x Time + Delay free",time="[ 1H 55M f.b.60M+5S/move free for both periods ]"},
--[[51]]{txt="2 x Time+Delay free",time="[ manual set ]"},
--[[52]]{txt="3 x Time+Delay free",time="[ manual set ]"},
--[[53]]{txt="Scrabble™",time="[ 25M ]"},
--[[54]]{txt="Scrabble™",time="[ manual set ]"},
--[[55]]{txt="Time restrict (exceed)",time="[ 30M+10S/move ]"},
--[[56]]{txt="Time restrict (exceed)",time="[ manual set ]"},
--[[57]]{txt="Time restrict (Limit)",time="[ 1H+30S/move ]"},
--[[58]]{txt="Time restrict (Limit)",time="[ manual set ]"},
}

local y=5
function showRule(num)
	if not num or num<1 or num>58 then
		return
	end
	if(font)then
		love.graphics.setFont(font)
	end
	if exRuleTxt~="" then
		love.graphics.printf(exRuleTxt,0,y,love.graphics.getWidth(),"center")
	else
		love.graphics.printf(rulesTxt[num].txt,0,y,love.graphics.getWidth(),"center")
		love.graphics.printf(rulesTxt[num].time,0,y+love.graphics.getFont():getHeight(),love.graphics.getWidth(),"center")
	end
end

function showName()
	if(font)then
		love.graphics.setFont(font)
	end
	love.graphics.printf(player[1].text,gTrans.ox,gTrans.oy+830*gTrans.sy,love.graphics.getWidth()/2-gTrans.ox,"center")
	love.graphics.printf(player[2].text,love.graphics.getWidth()/2,gTrans.oy+830*gTrans.sy,love.graphics.getWidth()/2-gTrans.ox,"center")
end
