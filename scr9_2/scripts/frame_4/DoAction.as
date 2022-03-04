initMapHeight();
setBtn();
setScr();
if(game.trigger1 == 1 || game.trigger2 == 1)
{
   placeObject(0,13,12,"corona",1);
}
placeObject(0,14,7,"guardA",2);
placeObject(0,18,7,"manC",3);
placeObject(0,15,24,"womanB",4);
stop();
