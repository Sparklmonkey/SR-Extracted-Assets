initMapHeight();
setBtn();
setScr();
if(game.Key == 2)
{
   game.sparkle1._visible = false;
   game.protect._visible = false;
}
else
{
   game.protect._visible = true;
}
if(game.trigger2 == 1)
{
   placeObject(0,14,14,"officier",1);
}
stop();
