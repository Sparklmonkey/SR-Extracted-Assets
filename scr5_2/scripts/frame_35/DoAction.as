initMapHeight();
setBtn();
setScr();
if(rope < 1)
{
   placeObject(0,5,14,"rope",1);
}
if(battle4 < 1)
{
   placeObject(0,5,11,"soldier",2);
}
if(battle5 < 1)
{
   placeObject(0,11,8,"soldier",3);
}
if(axe > 1)
{
   openPath1();
}
stop();
