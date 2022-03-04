initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone2Arr[8],20,19,2);
hotspot2 = new Object();
hotspot2 = setChar(root.zone2Arr[9],9,18,2);
hotspot1.objID = 1;
hotspot2.objID = 2;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
root.worldScrn = "spr_bkg28";
if(root.crntEvent.id == 3)
{
   placeObject(0,16,20,"chamberlain",1);
}
if(root.crntEvent.id == 4)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,20,14,"lument",1);
   }
}
if(root.crntEvent.id == 5)
{
   placeObject(0,13,15,"officier",1);
}
if(root.crntEvent.id == 6)
{
   placeObject(0,8,17,"lument",1);
}
if(root.crntEvent.id == 8)
{
   placeObject(0,17,22,"lument",1);
}
if(root.crntEvent.id == 9)
{
   placeObject(0,25,18,"chamberlain",1);
}
if(root.crntEvent.id == 10)
{
   placeObject(0,13,15,"sparkle",1);
}
if(root.crntEvent.id == 11)
{
   placeObject(0,13,20,"igneous",1);
}
if(comeFrom == "spr_bkg29")
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
