initMapHeight();
setBtn();
setScr();
if(game.card1 < 1)
{
   placeObject(0,22,19,"card",1);
}
if(game.card2 < 1)
{
   placeObject(0,11,12,"card",2);
}
if(game.invBook < 1)
{
   placeObject(0,11,19,"holyBook",1);
}
if(game.invBook > 0)
{
   game.openPath2();
}
stop();
