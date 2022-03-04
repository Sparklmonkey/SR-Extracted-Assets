initMapHeight();
setBtn();
setScr();
if(game.gameTrigger == 1 && game.text1 == 1)
{
   placeObject(0,12,12,"magma",1);
}
else if(game.gameTrigger == 3)
{
   placeObject(0,12,12,"magma",1);
}
if(game.gameTrigger < 5)
{
   placeObject(0,11,13,"teacher",1);
}
if(game.gameTrigger == 4 && game.openedGate == 1)
{
   game.openPath1();
   game.ironGate._visible = false;
}
stop();
