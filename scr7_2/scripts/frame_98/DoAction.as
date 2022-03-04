initMapHeight();
setBtn();
setScr();
if(game.dropRing < 1)
{
   game.porte._visible = false;
   placeObject(0,14,15,"merchantB",1);
}
else
{
   game.porte._visible = true;
   openPath();
}
placeObject(0,21,16,"tmanB",1);
stop();
