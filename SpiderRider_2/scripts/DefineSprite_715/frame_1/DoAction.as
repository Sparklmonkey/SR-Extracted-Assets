function showCard()
{
   pageNbrTxt.text = pageNb + " / " + maxPages;
   var firstItem = (pageNb - 1) * 4;
   var i = 0;
   while(i < 4)
   {
      var targetItem = eval("card" + i);
      var cardPos = firstItem + i;
      if(cardPos < merchantCard.length)
      {
         cardObj = root.findCardObj(Number(merchantCard[cardPos]));
         set(targetItem + ".cardID",cardObj.id);
         targetItem.gilsTxt.text = cardObj.cost;
         var tempCost = String(cardObj.cost).split("g");
         var cleanCost = Number(tempCost[0]);
         targetItem.blocker._visible = cleanCost > root.playerStats.gils;
         targetItem.card.drawCard(cardObj);
         targetItem.card.glow._visible = false;
         targetItem.card.shade._visible = false;
         targetItem.card.onRollOver = function()
         {
            cardShow.drawCard(this.myObj);
         };
         targetItem.card.onRollOut = function()
         {
            cardShow.hideCard();
         };
         targetItem.card.onRelease = function()
         {
            var _loc2_ = this;
            popUp.cardName = _loc2_.myObj.cTitle;
            var _loc1_ = String(_loc2_.myObj.cost).split("g");
            popUp.cardCost = Number(_loc1_[0]);
            popUp.cardID = Number(_loc2_.myObj.id);
            popUp.gotoAndPlay("show");
            _loc2_;
            _loc1_;
         };
      }
      else
      {
         targetItem.gilsTxt.text = "";
         targetItem.card.hideCard();
         targetItem.blocker._visible = false;
      }
      i++;
   }
}
stop();
