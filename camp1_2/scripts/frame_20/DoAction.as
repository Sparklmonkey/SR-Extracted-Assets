initMapHeight();
setBtn();
setScr();
if(battle1 < 1)
{
   placeObject(0,13,15,"pinchpounce",1);
}
if(battle3 < 1 && gameTrigger > 1)
{
   placeObject(0,16,11,"invectidSoldier",1);
   placeObject(0,18,10,"invectidCommander",1);
}
if(battle2 < 1)
{
   placeObject(0,17,10,"buzzbit",1);
}
stop();
