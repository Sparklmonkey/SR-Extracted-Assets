initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone4Arr2[2],10,16,0);
hotspot2 = new Object();
hotspot2 = setChar(root.zone4Arr2[3],16,11,0);
hotspot1.objID = 1;
hotspot2.objID = 2;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
if(root.crntEvent.id == 12)
{
   placeObject(0,20,19,"womanB",1);
   if(root.crntEvent.state == "result")
   {
      placeObject(0,13,13,"childA",1);
   }
}
root.worldScrn = "spr_bkg48";
if(comeFrom == "spr_bkg17")
{
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
