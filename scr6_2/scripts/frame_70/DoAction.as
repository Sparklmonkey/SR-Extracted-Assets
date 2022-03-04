initMapHeight();
setBtn();
setScr();
if(game.card1 < 1)
{
   placeObject(4,10,9,"cardField",1);
}
if(game.card2 < 1)
{
   placeObject(0,19,11,"cardField",2);
}
if(game.card3 < 1)
{
   placeObject(3,7,18,"cardField",3);
}
if(battle6 < 1)
{
   placeObject(2,10,11,"soldierA",1);
}
if(battle7 < 1)
{
   placeObject(0,19,15,"flyingA",2);
}
if(battle8 < 1)
{
   placeObject(1,9,17,"soldierB",3);
}
if(battle9 < 1)
{
   placeObject(0,15,19,"soldierA",4);
}
placeObject(0,19,19,"manE",1);
stop();
