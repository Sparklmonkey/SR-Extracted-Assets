initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone5Arr[12],20,12,2);
hotspot2 = new Object();
hotspot2 = setChar(root.zone5Arr[13],15,20,0);
hotspot1.objID = 1;
hotspot2.objID = 2;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
if(root.crntEvent.id == 2)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,14,9,"invectidTrooper",3);
   }
}
root.worldScrn = "spr_bkg54";
root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y);
comeFrom = root.worldScrn;
stop();
