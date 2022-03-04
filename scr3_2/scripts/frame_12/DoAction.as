initMapHeight();
setBtn();
setScr();
if(door < 1)
{
   game.bkg.gate2.gotoAndStop(1);
}
else if(door > 1)
{
   openPath1();
   game.stars._visible = false;
   game.bkg.gate2.gotoAndStop(2);
   game.bkg.gate.gotoAndStop(2);
   game.frg.gate.gotoAndStop(2);
}
if(battle2 < 1)
{
   placeObject(3,17,11,"bat",4);
}
if(battle3 < 1)
{
   game.btnContainer.level3.t_3_11_4._visible = false;
   game.btnContainer.level3.t_3_10_4._visible = false;
}
if(card2 < 1)
{
   placeObject(3,12,7,"cardField",7);
}
stop();
