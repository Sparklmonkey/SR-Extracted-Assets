initMapHeight();
setBtn();
setScr();
if(game.gameTrigger == 1 && game.text1 == 0)
{
   placeObject(0,17,22,"magma",1);
}
if(game.gameTrigger == 2 || game.gameTrigger == 4)
{
   placeObject(0,17,22,"magma",1);
}
if(game.gameTrigger > 1 && game.gameTrigger < 4)
{
   placeObject(0,15,15,"aquine",1);
}
stop();
