initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone2Arr[6],18,8,0);
hotspot2 = new Object();
hotspot2 = setChar(root.zone2Arr[7],13,14,0);
hotspot1.objID = 1;
hotspot2.objID = 2;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
if(root.crntEvent.id == 8)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,9,13,"invectidSoldier",1);
      placeObject(0,20,17,"invectidSoldier",1);
      placeObject(0,15,12,"corona",1);
   }
   else if(root.crntEvent.state == "result")
   {
      placeObject(0,15,12,"corona",1);
   }
}
if(root.crntEvent.id == 9)
{
   placeObject(0,15,15,"manD",1);
}
if(root.crntEvent.id == 11)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,15,15,"ballOfLight",1);
      placeObject(0,16,15,"manB",1);
   }
   else if(root.crntEvent.state == "result")
   {
      placeObject(0,18,12,"childA",1);
   }
}
root.worldScrn = "spr_bkg27";
root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y);
comeFrom = root.worldScrn;
stop();
