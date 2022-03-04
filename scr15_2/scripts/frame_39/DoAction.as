initMapHeight();
setBtn();
setScr();
placeObject(0,18,22,"craftsman",1);
placeObject(0,10,9,"womanB",1);
if(game.gold1 < 2)
{
   placeObject(0,19,20,"cardField",1);
}
if(game.gold1 == 2)
{
   if(game.ring == 0)
   {
      placeObject(0,16,19,"ring",1);
   }
}
stop();
