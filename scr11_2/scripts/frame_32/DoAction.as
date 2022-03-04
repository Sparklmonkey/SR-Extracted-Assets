initMapHeight();
setBtn();
setScr();
if(game.trigger3 == 1 || game.trigger2 == 1)
{
   placeObject(0,11,10,"corona",1);
   placeObject(0,18,14,"venus",2);
}
placeObject(0,18,19,"craftsman",3);
if(game.action1 == 0)
{
   placeObject(0,18,22,"cardField",1);
}
stop();
