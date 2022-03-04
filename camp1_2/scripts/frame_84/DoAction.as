initMapHeight();
setBtn();
setScr();
placeObject(0,14,11,"woodsman",1);
if(gameTrigger < 2)
{
   placeObject(0,14,13,"cathy",1);
}
if(text3 > 0 && card1 < 1)
{
   placeObject(0,21,17,"card",1);
}
stop();
