initMapHeight();
setBtn();
setScr();
if(game.trigger1 == 1 || game.trigger2 == 1 || game.trigger3 == 1 || game.trigger4 == 1)
{
   placeObject(0,15,13,"igneous",1);
   placeObject(0,17,11,"flame",1);
}
if(game.text3 == 1)
{
   if(game.neckless == 0)
   {
      placeObject(0,18,20,"neckless",1);
   }
}
placeObject(0,18,22,"craftsman",1);
stop();
