initMapHeight();
setBtn();
setScr();
if(game.trigger1 == 1 || game.trigger2 == 1 || game.trigger3 == 1)
{
   placeObject(0,17,10,"blacksmith",1);
}
if(game.trigger4 == 1 || game.trigger5 == 1 || game.trigger6 == 1)
{
   if(game.battle4 == 0)
   {
      placeObject(0,19,17,"soldier1",1);
   }
   if(game.battle5 == 0)
   {
      placeObject(0,15,18,"soldier2",1);
   }
   if(game.battle6 == 0)
   {
      placeObject(0,15,16,"soldier2",2);
   }
   if(game.action2 == 0)
   {
      placeObject(0,17,17,"blacksmith",1);
   }
}
if(game.Key == 2)
{
   game.porte._visible = true;
   game.protect._visible = false;
   game.sparkle1._visible = false;
}
else
{
   game.porte._visible = false;
   game.protect._visible = true;
}
stop();
