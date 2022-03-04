initMapHeight();
setBtn();
setScr();
if(game.battle1 < 1)
{
   placeObject(0,16,17,"buzzbit",1);
}
if(game.trigger3 == 1)
{
   placeObject(0,13,16,"corona",1);
   if(game.card3 < 1)
   {
      placeObject(0,13,20,"cardField",1);
   }
}
stop();
