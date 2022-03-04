initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone2Arr[0],10,11,0);
hotspot2 = new Object();
hotspot2 = setChar(root.zone2Arr[1],16,9,0);
hotspot1.objID = 1;
hotspot2.objID = 2;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
if(root.crntEvent.id == 1)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,15,24,"corona",1);
   }
}
if(root.crntEvent.id == 5)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,15,15,"corona",1);
   }
}
if(root.crntEvent.id == 6)
{
   placeObject(0,18,13,"guardC",1);
}
if(root.crntEvent.id == 8)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,15,15,"aquine",1);
      placeObject(0,14,11,"invectidTrooper",1);
   }
}
if(root.crntEvent.id == 9)
{
   placeObject(0,17,20,"guardC",1);
}
if(root.crntEvent.id == 11)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,12,8,"ballOfLight",1);
      placeObject(0,13,8,"manD",1);
   }
   else if(root.crntEvent.state == "result")
   {
      placeObject(0,16,17,"manA",1);
      placeObject(0,15,15,"sparkle",1);
   }
}
root.worldScrn = "spr_bkg24";
if(comeFrom == "spr_bkg7")
{
   ContxtMusic = "area2";
   root.sfx.gotoAndPlay(ContxtMusic);
   root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y,"2");
   areaName.area = root.getInsName("areaNmCity",root.parseKitWorld);
   areaName.gotoAndPlay("show");
}
else
{
   root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y);
}
comeFrom = root.worldScrn;
stop();
