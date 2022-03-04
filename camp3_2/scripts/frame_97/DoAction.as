initMapHeight();
setBtn();
setScr();
if(battle1 == 0)
{
   placeObject(1,16,20,"grasshop",1);
   placeObject(0,19,19,"invectidDriver",1);
}
if(gameTrigger > 1)
{
   placeObject(0,19,19,"lument",1);
}
stop();
