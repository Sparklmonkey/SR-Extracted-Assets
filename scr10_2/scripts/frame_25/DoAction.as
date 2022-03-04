initMapHeight();
setBtn();
setScr();
placeObject(2,14,15,"guardB",1);
placeObject(2,12,15,"guardC",1);
if(game.trigger2 == 1)
{
   game.openPath1();
}
if(game.trigger3 == 1 || game.trigger4 == 1)
{
   game.openPath6();
   game.protect._visible = true;
   placeObject(2,16,19,"chamberlain",1);
}
else
{
   game.protect._visible = false;
}
if(game.action4 == 1)
{
   placeObject(2,17,22,"Key",2);
}
stop();
