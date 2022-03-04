initMapHeight();
setBtn();
setScr();
if(game.action3 == 0)
{
   placeObject(0,19,15,"chamberlain",1);
}
if(game.trigger4 == 1 || game.trigger5 == 1 || game.trigger6 == 1)
{
   if(game.battle7 == 0)
   {
      placeObject(0,19,14,"soldier1",1);
   }
   if(game.battle8 == 0)
   {
      placeObject(0,17,15,"commander",1);
   }
}
stop();
