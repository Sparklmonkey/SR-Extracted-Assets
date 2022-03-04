initMapHeight();
setBtn();
setScr();
if(gameTrigger < 2)
{
   placeObject(0,17,11,"magma",1);
}
if(text1 > 0 && invGold < 1)
{
   placeObject(0,15,12,"gold",1);
}
if(gameTrigger > 1 && gameTrigger < 4)
{
   placeObject(0,9,11,"childA",1);
   placeObject(0,10,10,"healer",1);
}
if(gameTrigger > 3 && battle7 < 1)
{
   placeObject(0,22,19,"magma",1);
   placeObject(0,11,9,"invectidDriver",1);
}
stop();
