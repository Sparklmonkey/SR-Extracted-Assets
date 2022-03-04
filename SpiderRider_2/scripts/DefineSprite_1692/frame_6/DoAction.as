function showCard()
{
   var firstItem = (page - 1) * 10;
   var i = 0;
   while(i < 10)
   {
      var targetItem = eval("card" + i);
      var cardPos = firstItem + i;
      if(cardPos < root.cardData.length)
      {
         oWork = new Object();
         oWork = root.cardData[cardPos];
         cardObj = root.findCardObj(oWork.id);
         set(targetItem + ".cardID",cardObj.id);
         targetItem.drawCard(cardObj);
         targetItem.glow._visible = false;
      }
      else
      {
         targetItem.hideCard();
         targetItem.glow._visible = false;
         targetItem.shade._visible = false;
      }
      i++;
   }
}
txtCurrPage.text = root.getInsName("txtPage",root.parseKitVisual) + " " + (this._currentframe - 3) + "/7";
page = 3;
var i = 0;
while(i < 10)
{
   var targetItem = eval("card" + i);
   targetItem.onRollOver = function()
   {
      cardShow.drawCard(this.myObj);
   };
   targetItem.onRollOut = function()
   {
      cardShow.hideCard();
   };
   i++;
}
showCard();
stop();
