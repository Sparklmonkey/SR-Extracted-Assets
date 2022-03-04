initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone3Arr2[0],16,19,0);
hotspot2 = new Object();
hotspot2 = setChar(root.zone3Arr2[1],17,12,0);
hotspot1.objID = 1;
hotspot2.objID = 2;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
if(root.crntEvent.id == 1)
{
   placeObject(0,7,15,"manA",3);
}
if(root.crntEvent.id == 2)
{
   placeObject(0,19,22,"healer",3);
}
if(root.crntEvent.id == 6)
{
   placeObject(0,11,18,"womanA",1);
}
if(root.crntEvent.id == 7)
{
   placeObject(0,20,14,"womanMerchant",1);
}
root.worldScrn = "spr_bkg12";
if(comeFrom == "spr_bkg10")
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
