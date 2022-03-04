initMapHeight();
setBtn();
setScr();
placeObject(0,17,17,"igneous",1);
placeObject(0,15,16,"warrior1",1);
placeObject(0,19,17,"warrior2",1);
placeObject(0,17,19,"soldier2",1);
if(game.battle6 == 0)
{
   placeObject(0,10,8,"soldier1",1);
}
if(game.battle7 == 0)
{
   placeObject(0,11,8,"soldier1",2);
}
stop();
