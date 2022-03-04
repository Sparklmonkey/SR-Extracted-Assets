initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone4Arr2[0],13,21,0);
hotspot2 = new Object();
hotspot2 = setChar(root.zone4Arr2[1],20,12,0);
hotspot1.objID = 1;
hotspot2.objID = 2;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
root.worldScrn = "spr_bkg47";
if(comeFrom == "spr_bkg57")
{
   ContxtMusic = "area4";
   root.sfx.gotoAndPlay(ContxtMusic);
   root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y,"42");
   areaName.area = root.getInsName("areaNmSchool",root.parseKitWorld);
   areaName.gotoAndPlay("show");
}
else
{
   root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y);
}
comeFrom = root.worldScrn;
stop();
