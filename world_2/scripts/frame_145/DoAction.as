initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone2Arr[2],10,13,0);
hotspot2 = new Object();
hotspot2 = setChar(root.zone2Arr[3],19,15,0);
hotspot1.objID = 1;
hotspot2.objID = 2;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
if(root.crntEvent.id == 6)
{
   placeObject(0,15,15,"healer",1);
}
if(root.crntEvent.id == 8)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,11,9,"invectidDarkFlying",1);
      placeObject(0,15,15,"invectidTrooper",1);
      placeObject(0,18,9,"igneous",1);
   }
   else if(root.crntEvent.state == "result")
   {
      placeObject(0,18,9,"igneous",1);
   }
}
if(root.crntEvent.id == 10)
{
   placeObject(0,9,8,"igneous",1);
   if(root.crntEvent.state == "result")
   {
      placeObject(0,17,12,"lument",1);
      placeObject(0,10,14,"magma",1);
      placeObject(0,15,15,"statu",1);
   }
}
if(root.crntEvent.id == 11)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,19,20,"ballOfLight",1);
      placeObject(0,20,20,"womanA",1);
   }
   else if(root.crntEvent.state == "result")
   {
      placeObject(0,15,15,"womanA",1);
   }
}
root.worldScrn = "spr_bkg25";
root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y);
comeFrom = root.worldScrn;
stop();
