initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone3Arr1[4],9,17,0);
hotspot2 = new Object();
hotspot2 = setChar(root.zone3Arr1[5],16,7,4);
hotspot1.objID = 1;
hotspot2.objID = 2;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
if(root.crntEvent.id == 2)
{
   if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
   {
      placeObject(0,8,10,"invectidSoldier",3);
   }
}
root.worldScrn = "spr_bkg9";
if(comeFrom == "spr_bkg19" || comeFrom == "spr_bkg14")
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
