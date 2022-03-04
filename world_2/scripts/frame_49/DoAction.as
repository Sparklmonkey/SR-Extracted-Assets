initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone3Arr2[2],10,14,0);
hotspot2 = new Object();
hotspot2 = setChar(root.zone3Arr2[3],15,11,0);
hotspot1.objID = 1;
hotspot2.objID = 2;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
if(root.crntEvent.id == 1)
{
   placeObject(0,17,22,"womanA",3);
}
if(root.crntEvent.id == 4)
{
   placeObject(0,15,15,"officier",1);
}
if(root.crntEvent.id == 7)
{
   placeObject(0,7,10,"WomanB",1);
}
root.worldScrn = "spr_bkg13";
if(comeFrom == "spr_bkg18")
{
   root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y,"32");
   areaName.area = root.getInsName("areaNmVillage",root.parseKitWorld);
   areaName.gotoAndPlay("show");
}
else
{
   root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y);
}
comeFrom = root.worldScrn;
stop();
