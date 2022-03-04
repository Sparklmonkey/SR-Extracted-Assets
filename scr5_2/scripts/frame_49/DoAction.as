initMapHeight();
setBtn();
setScr();
if(battle6 < 1)
{
   placeObject(0,6,12,"soldier",1);
}
if(battle7 < 1)
{
   placeObject(0,14,14,"soldier",2);
}
if(battle8 < 1)
{
   placeObject(0,12,21,"soldier",3);
}
if(battle9 < 1)
{
   placeObject(0,21,20,"soldier",4);
}
placeObject(0,16,10,"guardHurt",5);
if(balsam > 1 && doorKey < 1)
{
   placeObject(0,16,10,"doorKey",6);
}
stop();
