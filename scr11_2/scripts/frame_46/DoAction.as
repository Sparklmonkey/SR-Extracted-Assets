initMapHeight();
setBtn();
setScr();
placeObject(2,6,14,"lument",1);
if(game.trigger1 == 1 || game.trigger2 == 1)
{
   placeObject(0,11,13,"chamberlain",1);
}
if(game.trigger2 == 1)
{
   if(game.gold1 == 0)
   {
      placeObject(0,13,15,"gold",1);
   }
   if(game.gold2 == 0)
   {
      placeObject(0,16,15,"gold",2);
   }
   if(game.gold3 == 0)
   {
      placeObject(0,19,15,"gold",3);
   }
}
stop();
