initMapHeight();
setBtn();
setScr();
if(battle10 < 1)
{
   placeObject(0,15,12,"greatNasty",1);
}
if(battle11 < 1)
{
   placeObject(0,17,22,"buzzBit",2);
}
if(womanbag < 1)
{
   placeObject(0,8,8,"womanbag",3);
}
placeObject(0,19,12,"woodsman",4);
if(doorKey > 1 && axe < 1)
{
   game.placeObject(0,21,13,"axe",5);
}
stop();
