initMapHeight();
setBtn();
setScr();
if(rope > 1)
{
   openPath1();
}
if(card1 < 1)
{
   placeObject(1,5,15,"cardField",3);
}
if(game.battle1 < 1)
{
   game.btnContainer.level0.t_0_3_12._visible = false;
   game.btnContainer.level0.t_0_3_11._visible = false;
}
stop();
