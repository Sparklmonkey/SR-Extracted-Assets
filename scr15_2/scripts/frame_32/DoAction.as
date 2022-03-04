initMapHeight();
setBtn();
setScr();
placeObject(0,10,11,"womanC",1);
if(game.ring == 2)
{
   if(game.gold2 == 0)
   {
      placeObject(0,11,15,"gold",1);
   }
   if(game.card6 == 0)
   {
      placeObject(0,14,19,"cardField",1);
   }
}
stop();
