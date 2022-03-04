initMapHeight();
setBtn();
setScr();
if(game.card5 == 0)
{
   placeObject(0,12,16,"cardField",1);
}
if(game.KeyA == 2)
{
   game.sparkle._visible = false;
   game.openPath3();
}
stop();
