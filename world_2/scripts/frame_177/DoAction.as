initMapHeight();
setBtn();
setScr();
root.worldScrn = "spr_bkg29";
if(comeFrom == "spr_bkg28")
{
   ContxtMusic = "area1";
   root.sfx.gotoAndPlay(ContxtMusic);
   root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y,"1");
   areaName.area = root.getInsName("areaNmFortress",root.parseKitWorld);
   areaName.gotoAndPlay("show");
}
else
{
   root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y);
}
comeFrom = root.worldScrn;
stop();
