initMapHeight();
setBtn();
setScr();
root.worldScrn = "spr_bkg32";
root.callWarp(root.worldScrn,itemContainer._x + char._x,itemContainer._y + char._y);
comeFrom = root.worldScrn;
stop();
