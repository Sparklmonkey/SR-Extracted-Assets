initMapHeight();
setBtn();
setScr();
if(game.trigger1 == 1)
{
   placeObject(0,10,11,"guardA",1);
}
else
{
   placeObject(0,12,8,"guardA",1);
}
if(game.text13 == 1)
{
   game.openPath1();
}
stop();
