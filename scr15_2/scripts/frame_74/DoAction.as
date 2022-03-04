initMapHeight();
setBtn();
setScr();
if(game.card2 == 0)
{
   placeObject(0,12,7,"cardField",2);
}
if(game.card1 == 0)
{
   placeObject(0,12,21,"cardField",1);
}
stop();
