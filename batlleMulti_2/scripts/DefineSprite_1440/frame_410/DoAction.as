function drawCard(obj)
{
   var _loc1_ = obj;
   myObj = _loc1_;
   _visible = true;
   diceBox._visible = diceTxt._visible = diceBoxVis = _loc1_.dice > 0;
   diceTxt.text = _loc1_.dice;
   armorBox._visible = armorTxt._visible = armorBoxVis = _loc1_.defense > 0;
   armorTxt.text = _loc1_.defense;
   actionBox._visible = actionTxt._visible = actionBoxVis = _loc1_.card > 0;
   actionTxt.text = _loc1_.card;
   titleTxt.text = _loc1_.cTitle;
   commentTxt._visible = commentTxt2._visible = _loc1_.comment;
   commentTxt.text = _loc1_.comment;
   gotoAndStop("ID_" + _loc1_.id);
}
function hideCard()
{
   gotoAndStop(1);
   glow._visible = false;
   diceBoxVis = false;
   armorBoxVis = false;
   actionBoxVis = false;
   _visible = false;
}
hideCard();
stop();
