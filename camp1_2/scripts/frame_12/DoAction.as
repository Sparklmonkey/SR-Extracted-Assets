initMapHeight();
setBtn();
setScr();
if(gameTrigger < 2)
{
   placeObject(0,10,10,"healer",1);
}
if(invRemedy < 1 && invBottle > 1)
{
   placeObject(0,14,12,"oileflask",1);
}
if(gameTrigger > 2 && battle6 < 1)
{
   placeObject(0,16,9,"grasshop",1);
}
stop();
