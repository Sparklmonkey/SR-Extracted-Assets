initMapHeight();
setBtn();
setScr();
if(game.trigger1 == 1 || game.trigger2 == 1 || game.trigger3 == 1 || game.trigger4 == 1)
{
   placeObject(0,10,9,"corona",1);
   placeObject(0,15,9,"igneous",1);
}
if(game.action4 == 0)
{
   placeObject(0,18,21,"craftsman",1);
}
if(game.trigger5 == 1 || game.trigger6 == 1)
{
   if(game.battle9 == 0)
   {
      placeObject(0,16,18,"soldier1",1);
   }
   if(game.battle10 == 0)
   {
      placeObject(0,18,18,"soldier1",2);
   }
}
if(game.trigger6 == 1)
{
   if(game.Key == 0)
   {
      placeObject(0,20,19,"Key",1);
   }
}
stop();
