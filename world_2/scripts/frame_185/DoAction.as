initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone1Arr[0],11,15,0);
hotspot2 = new Object();
hotspot2 = setChar(root.zone1Arr[1],20,19,0);
hotspot1.objID = 1;
hotspot2.objID = 2;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
if(root.crntEvent.id == 4)
{
   if(root.crntEvent.state == "result")
   {
      placeObject(0,16,21,"corona",3);
      placeObject(0,14,21,"officier",4);
      placeObject(0,20,15,"lument",5);
   }
   placeObject(0,15,15,"sparkle",6);
}
if(root.crntEvent.id == 8)
{
   if(root.crntEvent.state != "done")
   {
      placeObject(0,19,21,"sparkle",1);
   }
}
if(root.crntEvent.id == 9)
{
   placeObject(0,14,15,"lument",1);
}
if(root.crntEvent.id == 10)
{
   placeObject(0,15,15,"corona",1);
}
root.worldScrn = "spr_bkg30";
root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y);
comeFrom = root.worldScrn;
stop();
