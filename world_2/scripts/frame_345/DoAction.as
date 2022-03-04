initMapHeight();
setBtn();
setScr();
placeObject(0,11,15,"monk",3);
root.worldScrn = "spr_bkg50";
root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y);
comeFrom = root.worldScrn;
stop();
