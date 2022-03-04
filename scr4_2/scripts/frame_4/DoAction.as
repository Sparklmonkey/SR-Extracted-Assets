initMapHeight();
setBtn();
setScr();
if(battle1 < 1)
{
   placeObject(0,7,10,"poisonFlower",1);
}
if(battle2 < 1)
{
   placeObject(0,23,17,"poisonFlower2",2);
}
if(battle3 < 1)
{
   placeObject(0,15,7,"buzzBit",3);
}
else
{
   openPath1();
}
if(card1 < 1)
{
   placeObject(0,15,5,"cardField",4);
}
stop();
