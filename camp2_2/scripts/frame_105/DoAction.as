initMapHeight();
setBtn();
setScr();
if(game.gameTrigger == 1)
{
   placeObject(0,14,16,"aquine",1);
   placeObject(0,19,19,"childA",1);
   placeObject(0,20,12,"childC",1);
}
if(game.gameTrigger == 2 || game.gameTrigger == 3)
{
   placeObject(0,19,19,"childA",1);
   placeObject(0,20,12,"childC",1);
}
if(game.gameTrigger == 4 && game.digHole < 1)
{
   placeObject(0,11,11,"secretPlace",1);
}
if(game.digHole == 1 && game.keyItem < 1)
{
   placeObject(0,11,11,"KeyItem",1);
}
stop();
