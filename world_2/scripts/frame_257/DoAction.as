initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone6Arr[6],12,17,0);
hotspot2 = new Object();
hotspot2 = setChar(root.zone6Arr[7],21,14,0);
hotspot1.objID = 1;
hotspot2.objID = 2;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
if(root.crntEvent.id == 12)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,13,13,"childA",1);
      placeObject(0,17,20,"invectidSoldier",1);
      placeObject(0,18,15,"stag",1);
   }
   else if(root.crntEvent.state == "result")
   {
      placeObject(0,18,15,"stag",1);
   }
}
root.worldScrn = "spr_bkg39";
root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y);
comeFrom = root.worldScrn;
stop();
