initMapHeight();
setBtn();
setScr();
placeObject(5,15,12,"guard",1);
placeObject(5,13,12,"guard",2);
if(game.trigger3 == 1)
{
   placeObject(5,13,14,"sparkle",3);
}
if(game.purpleFlower > 1)
{
   game.openPath1();
}
stop();
