initMapHeight();
setBtn();
setScr();
if(game.trigger1 == 1)
{
   placeObject(0,14,9,"corona",1);
   placeObject(0,18,14,"venus",2);
}
if(game.action1 == 1)
{
   placeObject(0,13,10,"seal",4);
}
placeObject(0,17,20,"craftsman",3);
stop();
