cardObj = root.findCardObj(cardId);
card.drawCard(cardObj);
if(other != undefined)
{
   typeReward.gotoAndStop(other);
   typeReward.nbrTxt.text = ammount;
   typeReward.txtVicPts.text = root.getInsName("txtVicPts",root.parseKitVisual);
   card._visible = false;
}
else
{
   typeReward._visible = false;
}
stop();
