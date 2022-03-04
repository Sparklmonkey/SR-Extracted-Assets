initMapHeight();
setBtn();
setScr();
if(gameTrigger > 4)
{
   game.doorShown.gotoAndStop("end");
   game.puzzlefrag1._visible = false;
   game.puzzlefrag2._visible = false;
   game.puzzlefrag3._visible = false;
   game.puzzlefrag4._visible = false;
   game.puzzlefrag5._visible = false;
   game.lockBtn._visible = false;
}
else
{
   placeObject(0,15,12,"corona",1);
}
if(card4 < 1)
{
   placeObject(0,12,17,"card",1);
}
stop();
