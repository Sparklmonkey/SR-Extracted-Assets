initMapHeight();
setBtn();
setScr();
hotspot1 = new Object();
hotspot1 = setChar(root.zone2Arr[10],9,16,0);
hotspot2 = new Object();
hotspot2 = setChar(root.zone2Arr[11],22,12,0);
hotspot1.objID = 1;
hotspot2.objID = 2;
placeObject(hotspot1.level,hotspot1.xTile,hotspot1.yTile,hotspot1.name,1);
placeObject(hotspot2.level,hotspot2.xTile,hotspot2.yTile,hotspot2.name,2);
root.worldScrn = "spr_bkg43";
root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y,"2");
comeFrom = root.worldScrn;
stop();
