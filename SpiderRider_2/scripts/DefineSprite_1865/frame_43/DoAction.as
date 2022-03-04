var i = 0;
while(i < guildCardIDArr.length)
{
   var cardObj = root.findCardObj(guildCardIDArr[i]);
   if(cardObj != undefined)
   {
      this["cardShow" + (i + 1)].cardID = cardObj.id;
      this["cardShow" + (i + 1)].drawCard(cardObj);
      this["cardShow" + (i + 1)].onRollOver = function()
      {
         this._parent.cardShowOver.drawCard(this.myObj);
      };
      this["cardShow" + (i + 1)].onRollOut = function()
      {
         this._parent.cardShowOver.hideCard();
      };
   }
   else
   {
      this["cardShow" + (i + 1)]._visible = false;
   }
   i++;
}
delete guildCardIDArr;
stop();
