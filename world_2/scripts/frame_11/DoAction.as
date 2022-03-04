initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone3Arr1[2],11,15,0);
hotspot2 = new Object();
hotspot2 = setChar(root.zone3Arr1[3],17,12,0);
hotspot1.objID = 1;
hotspot2.objID = 2;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
if(root.crntEvent.id == 2)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,18,9,"invectidSoldier",3);
   }
}
if(root.crntEvent.id == 5)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,19,14,"invectidTrooper",1);
   }
   else if(root.crntEvent.state == "result")
   {
      placeObject(0,17,8,"venus",1);
      placeObject(0,15,15,"corona",1);
   }
}
if(root.crntEvent.id == 7)
{
   placeObject(0,17,18,"manB",1);
}
root.worldScrn = "spr_bkg8";
root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y);
comeFrom = root.worldScrn;
stop();
