initMapHeight();
setBtn();
setScr();
if(board > 1)
{
   openPath1();
   game.stars._visible = false;
}
if(monacle < 1)
{
   placeObject(0,13,13,"monacle",1);
}
stop();
