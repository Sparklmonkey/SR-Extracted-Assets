initMapHeight();
setBtn();
setScr();
if(game.trigger2 == 1)
{
   placeObject(0,15,23,"corona",1);
}
if(game.card1 < 1)
{
   placeObject(0,11,6,"cardField",1);
}
if(game.card2 < 1)
{
   placeObject(0,11,8,"cardField",2);
}
if(game.action2 == 1)
{
   placeObject(0,16,23,"Key",1);
}
if(game.trigger3 == 1 || game.trigger4 == 1)
{
   placeObject(0,18,20,"officier",1);
}
stop();
