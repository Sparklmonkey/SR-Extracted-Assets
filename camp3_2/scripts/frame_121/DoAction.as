initMapHeight();
setBtn();
setScr();
if(gameTrigger < 5)
{
   placeObject(0,17,16,"magma",1);
}
if(gameTrigger < 5 && gameTrigger > 1)
{
   placeObject(0,17,14,"igneous",1);
}
if(gameTrigger > 1 && battle6 < 1)
{
   placeObject(1,7,15,"beerain",1);
}
if(gameTrigger > 3)
{
   gate._visible = false;
   lockBtn._visible = false;
}
stop();
