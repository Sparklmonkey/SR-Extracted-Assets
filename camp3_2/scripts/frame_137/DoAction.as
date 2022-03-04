initMapHeight();
setBtn();
setScr();
if(battle5 < 1)
{
   placeObject(0,17,16,"shumdigger",1);
   placeObject(0,17,15,"KeyItem",1);
}
if(gameTrigger < 4)
{
   placeObject(0,11,17,"corona",1);
}
if(game.battle5 > 0 && game.card1 < 1)
{
   placeObject(0,15,22,"card",1);
}
stop();
