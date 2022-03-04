initMapHeight();
setBtn();
setScr();
if(game.balsam == 0)
{
   placeObject(0,13,14,"venus",1);
}
if(game.trigger5 == 1)
{
   game.openPath2();
}
if(game.trigger6 == 1 || game.trigger7 == 1)
{
   game.rockblok._visible = true;
   game.closePath1();
}
else
{
   game.rockblok._visible = false;
}
stop();
