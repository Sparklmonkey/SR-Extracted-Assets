initMapHeight();
setBtn();
setScr();
if(game.action5 == 0)
{
   placeObject(0,14,16,"womanC",1);
}
if(game.trigger6 == 1)
{
   if(game.battle11 == 0)
   {
      placeObject(0,12,17,"soldier1",1);
   }
   if(game.battle12 == 0)
   {
      placeObject(0,15,14,"warrior",1);
   }
}
stop();
