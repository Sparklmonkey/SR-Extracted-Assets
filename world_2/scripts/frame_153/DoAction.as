initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone2Arr[4],11,17,0);
hotspot2 = new Object();
hotspot2 = setChar(root.zone2Arr[5],21,17,0);
hotspot1.objID = 1;
hotspot2.objID = 2;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
if(root.crntEvent.id == 1)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,12,9,"sparkle",3);
   }
}
if(root.crntEvent.id == 2)
{
   placeObject(0,17,15,"cathy",3);
}
if(root.crntEvent.id == 3)
{
   placeObject(0,15,15,"sparkle",1);
}
if(root.crntEvent.id == 5)
{
   placeObject(0,15,15,"blacksmith",1);
}
if(root.crntEvent.id == 6)
{
   placeObject(0,22,16,"childA",1);
}
if(root.crntEvent.id == 7)
{
   placeObject(0,18,21,"magma",1);
}
if(root.crntEvent.id == 8)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,15,15,"invectidDriver",1);
      placeObject(0,15,20,"invectidFlying",1);
   }
}
if(root.crntEvent.id == 9)
{
   placeObject(0,22,19,"manA",1);
}
if(root.crntEvent.id == 10)
{
   placeObject(0,20,14,"chamberlain",1);
}
if(root.crntEvent.id == 11)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,21,19,"ballOfLight",1);
      placeObject(0,20,19,"manC",1);
   }
   else if(root.crntEvent.state == "result")
   {
      placeObject(0,10,10,"guardC",1);
   }
}
root.worldScrn = "spr_bkg26";
root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y);
comeFrom = root.worldScrn;
stop();
