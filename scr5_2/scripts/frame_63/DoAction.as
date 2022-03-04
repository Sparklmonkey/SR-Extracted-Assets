initMapHeight();
setBtn();
setScr();
if(battle12 < 1)
{
   placeObject(9,17,19,"poisonFlower",1);
}
if(battle13 < 1)
{
   placeObject(9,8,15,"poisonFlower",2);
}
if(battle14 < 1)
{
   placeObject(9,8,6,"poisonFlower",3);
}
if(card1 < 1)
{
   placeObject(6,23,19,"cardField",4);
}
if(card2 < 1)
{
   placeObject(12,6,8,"cardField",5);
}
if(card3 < 1)
{
   placeObject(9,11,8,"cardField",6);
}
if(card4 < 1)
{
   placeObject(9,10,4,"cardField",7);
}
if(rope > 1)
{
   openPath1();
}
stop();
