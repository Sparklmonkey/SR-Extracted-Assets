initMapHeight();
setBtn();
setScr();
stop();
if(event7 < 1)
{
   placeObject(0,20,22,"tmanA",2);
}
if(boardDroped > 0)
{
   sparkle2._visible = false;
   game.boardShow._visible = true;
   openPath1();
}
else
{
   game.boardShow._visible = false;
}
if(web == 1)
{
   sparkle1._visible = false;
   openPath2();
}
else
{
   placeObject(0,22,20,"toile",1);
}
if(game.stone == 1)
{
   placeObject(0,24,19,"woman",1);
}
