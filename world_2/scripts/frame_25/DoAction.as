initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone3Arr1[6],19,16,0);
hotspot2 = new Object();
hotspot2 = setChar(root.zone3Arr1[7],10,8,0);
hotspot1.objID = 1;
hotspot2.objID = 2;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
if(root.crntEvent.id == 1)
{
   placeObject(0,11,14,"woodsman",3);
}
if(root.crntEvent.id == 2)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,16,14,"invectidSoldier",3);
   }
}
if(root.crntEvent.id == 5)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,17,11,"venus",1);
   }
}
root.worldScrn = "spr_bkg10";
if(comeFrom == "spr_bkg12" || comeFrom == "spr_bkg16")
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
