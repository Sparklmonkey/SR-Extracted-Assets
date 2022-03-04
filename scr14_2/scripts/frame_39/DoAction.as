initMapHeight();
setBtn();
setScr();
if(game.trigger4 == 1)
{
   placeObject(0,18,11,"womanA",1);
   placeObject(0,8,11,"childA",1);
   if(game.text22 == 1)
   {
      if(game.balsam == 0)
      {
         placeObject(0,17,12,"balsam",1);
      }
   }
}
stop();
