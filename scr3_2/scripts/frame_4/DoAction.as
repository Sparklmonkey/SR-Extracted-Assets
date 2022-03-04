initMapHeight();
setBtn();
setScr();
if(doorKey < 1)
{
   placeObject(0,10,13,"doorKey",12);
}
if(board < 1)
{
   placeObject(0,12,20,"board",13);
}
if(card4 < 1)
{
   placeObject(0,20,13,"cardField",1);
}
if(card5 < 1)
{
   placeObject(0,11,10,"cardField",2);
}
if(card6 < 1)
{
   placeObject(0,20,23,"cardField",3);
}
if(monacle > 1)
{
   stars._visible = false;
}
stop();
