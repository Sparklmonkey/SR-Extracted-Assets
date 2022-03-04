initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone3Arr1[0],11,15,0);
hotspot1.objID = 1;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
trace("game.hotspot1 : " + hotspot1.objID);
hotspot2 = new Object();
hotspot2 = setChar(root.zone3Arr1[1],17,12,0);
hotspot2.objID = 2;
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
trace("game.hotspot2 : " + hotspot2.objID);
if(root.crntEvent.id == 2)
{
   placeObject(0,15,16,"igneous",3);
}
if(root.crntEvent.id == 4)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,23,17,"corona",1);
   }
}
if(root.crntEvent.id == 5)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,15,15,"invectidSoldier",1);
      placeObject(0,10,18,"grasshop",1);
   }
}
if(root.crntEvent.id == 6)
{
   placeObject(0,14,18,"beerain",1);
}
if(root.crntEvent.id == 10)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,15,12,"lument",1);
   }
}
if(root.crntEvent.id == 11)
{
   placeObject(0,15,12,"grasshop",1);
}
if(root.crntEvent.id == 12)
{
   placeObject(0,20,19,"corona",1);
}
root.worldScrn = "spr_bkg7";
if(comeFrom == "spr_bkg24")
{
   root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y,"31");
   ContxtMusic = "area3";
   root.sfx.gotoAndPlay(ContxtMusic);
   areaName.area = root.getInsName("areaNmField",root.parseKitWorld);
   areaName.gotoAndPlay("show");
}
else
{
   root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y);
}
comeFrom = root.worldScrn;
stop();
