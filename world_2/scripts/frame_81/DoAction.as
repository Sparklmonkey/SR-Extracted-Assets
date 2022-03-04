initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone4Arr1[6],9,16,0);
hotspot2 = new Object();
hotspot2 = setChar(root.zone4Arr1[7],17,12,0);
hotspot1.objID = 1;
hotspot2.objID = 2;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
if(root.crntEvent.id == 2)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,15,15,"invectidFlying",3);
   }
}
root.worldScrn = "spr_bkg17";
if(comeFrom == "spr_bkg48")
{
   root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y,"41");
   areaName.area = root.getInsName("areaNmForest",root.parseKitWorld);
   areaName.gotoAndPlay("show");
}
else
{
   root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y);
}
comeFrom = root.worldScrn;
stop();
