initMapHeight();
setBtn();
setScr();
if(game.trigger3 != 1)
{
   placeObject(0,13,15,"sparkle",2);
}
if(game.trigger2 == 1)
{
   if(game.action1 == 1)
   {
      placeObject(0,14,14,"purpleFlower",1);
   }
}
stop();
