initMapHeight();
setBtn();
setScr();
if(game.trigger2 == 1)
{
   placeObject(0,11,16,"sparkle",1);
   placeObject(0,10,12,"hortala",1);
}
if(game.trigger3 == 1)
{
   placeObject(0,12,16,"hortala",1);
}
if(game.trigger4 == 1)
{
   placeObject(0,15,18,"hortala",1);
   placeObject(0,18,19,"corona",1);
}
if(game.keyB == 2)
{
   game.sparkle1._visible = false;
   game.porte1._visible = true;
   game.openPath3();
}
stop();
