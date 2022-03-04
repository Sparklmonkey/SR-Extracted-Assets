initMapHeight();
setBtn();
setScr();
placeObject(0,13,17,"sparkle",1);
if(game.battle2 < 1)
{
   placeObject(0,18,17,"buzzbit",1);
}
if(game.battle3 < 1)
{
   placeObject(0,10,13,"buzzbit",2);
}
placeObject(0,15,14,"dungobee",1);
stop();
