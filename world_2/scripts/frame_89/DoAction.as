initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone4Arr1[8],9,17,0);
hotspot2 = new Object();
hotspot2 = setChar(root.zone4Arr1[9],19,15,0);
hotspot1.objID = 1;
hotspot2.objID = 2;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
if(root.crntEvent.id == 2)
{
   placeObject(0,13,13,"magma",3);
}
if(root.crntEvent.id == 12)
{
   placeObject(0,15,15,"monk",1);
}
root.worldScrn = "spr_bkg18";
if(comeFrom == "spr_bkg13" || comeFrom == "spr_bkg49")
{
   root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y,"41");
   ContxtMusic = "area4";
   root.sfx.gotoAndPlay(ContxtMusic);
   areaName.area = root.getInsName("areaNmForest",root.parseKitWorld);
   areaName.gotoAndPlay("show");
}
else
{
   root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y);
}
comeFrom = root.worldScrn;
stop();
