function showCard(pageNb)
{
   pageNbrTxt.text = pageNb;
   var firstItem = (pageNb - 1) * 10;
   var i = 0;
   while(i < 10)
   {
      var targetItem = eval("card" + i);
      var cardPos = firstItem + i;
      if(cardPos < root.playerStats.card.length)
      {
         oWork = new Object();
         oWork = root.playerStats.card[cardPos];
         cardObj = root.findCardObj(oWork.id);
         set(targetItem + ".cardID",cardObj.id);
         set(targetItem + ".cardPos",cardPos);
         targetItem.drawCard(cardObj);
         targetItem.glow._visible = false;
         targetItem.shade._visible = false;
      }
      else
      {
         targetItem.hideCard();
      }
      i++;
   }
}
cardAcqObj = root.findCardObj(this.acquiredCardID);
txtTooMany.text = root.getInsName("txtTooMany",root.parseKitVisual);
txtCardDel.text = root.getInsName("txtCardDel",root.parseKitVisual);
txtPage.text = root.getInsName("txtPage",root.parseKitVisual);
var i = 0;
while(i < 10)
{
   var targetItem = eval("card" + i);
   targetItem.onRollOver = function()
   {
      cardShowOver.drawCard(this.myObj);
   };
   targetItem.onRollOut = function()
   {
      cardShowOver.hideCard();
   };
   targetItem.onRelease = function()
   {
      var _loc1_ = this;
      questionTxt = getInsName("msgDelCard",parseKitCards);
      root.tempCardSetID2 = cardID = _loc1_.cardID;
      root.tempCardSetPos = _loc1_.cardPos;
      cardName = _loc1_.myObj.cTitle;
      popUp.gotoAndPlay("show");
      _loc1_;
   };
   i++;
}
cardAcquired.onRollOver = function()
{
   cardShowOver.drawCard(cardAcquired.myObj);
};
cardAcquired.onRollOut = function()
{
   cardShowOver.hideCard();
};
pageNb = 1;
frameCall = 8;
this.onEnterFrame = function()
{
   if(frameCall > 0)
   {
      frameCall--;
   }
   else
   {
      delete this.onEnterFrame;
      delete frameCall;
      cardAcquired.drawCard(cardAcqObj);
      showCard(pageNb);
   }
};
