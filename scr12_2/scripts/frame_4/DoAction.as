initMapHeight();
setBtn();
setScr();
placeObject(0,11,11,"guardA",1);
if(game.trigger1 == 1 || game.trigger2 == 1 || game.trigger3 == 1)
{
   placeObject(0,15,8,"manB",1);
}
if(game.trigger4 == 1 || game.trigger5 == 1 || game.trigger6 == 1)
{
   if(game.action1 == 0)
   {
      placeObject(0,15,24,"manB",1);
   }
   if(game.battle3 == 0)
   {
      placeObject(0,17,22,"soldier1",1);
   }
   if(game.battle2 == 0)
   {
      placeObject(0,8,12,"soldier2",1);
   }
   if(game.battle1 == 0)
   {
      placeObject(0,8,11,"soldier2",2);
   }
}
stop();
