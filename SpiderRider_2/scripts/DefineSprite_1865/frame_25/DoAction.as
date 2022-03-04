txtDeck.text = txtDeckS.text = root.getInsName("txtDeck",root.parseKitSheets);
txtCollection.text = root.getInsName("txtCollection",root.parseKitSheets);
txtPage.text = root.getInsName("txtPage",root.parseKitVisual);
root.setDeckOrder();
switchedActive = "A";
var i = 0;
while(i < root.playerStats.card.length)
{
   trace(root.playerStats.card[i].id);
   i++;
}
spiderTabC = new Color(spiderTab);
campaignBtnC = new Color(btn_camp);
var deckA = new Array();
var deckB = new Array();
var deckC = new Array();
root.googleAnalytic("javascript:urchinTracker(\'/character/cards\');");
deckBtnA.gotoAndStop("over");
cardQty.text = root.playerStats.card.length;
darker = {ra:"50",rb:"0",ga:"50",gb:"0",ba:"50",bb:"0",aa:"100",ab:"0"};
§§push(function switchDeck(newDeck)
{
   deckBtnA.gotoAndStop(1);
   deckBtnB.gotoAndStop(1);
   deckBtnC.gotoAndStop(1);
   switchedActive = newDeck;
   deckTxt1.text = deckTxt2.text = switchedActive;
   showCard(pageNb);
});
§§push(function getDeckNbr(crntDeck, deckSelected)
{
   var _loc1_ = deckSelected;
   switch(crntDeck)
   {
      case 0:
         §§push(_loc1_);
         §§push(undefined);
         §§push(undefined);
         if(_loc1_ == "A")
         {
            §§push(1);
            break;
         }
         if(_loc1_ == "B")
         {
            §§push(2);
            break;
         }
         §§push(3);
         break;
      case 1:
         if(_loc1_ == "A")
         {
            §§push(0);
            break;
         }
         if(_loc1_ == "B")
         {
            §§push(4);
            break;
         }
         §§push(5);
         break;
      case 2:
         if(_loc1_ == "A")
         {
            §§push(4);
            break;
         }
         if(_loc1_ == "B")
         {
            §§push(0);
            break;
         }
         §§push(6);
         break;
      case 3:
         if(_loc1_ == "A")
         {
            §§push(5);
            break;
         }
         if(_loc1_ == "B")
         {
            §§push(6);
            break;
         }
         §§push(0);
         break;
      case 4:
         if(_loc1_ == "A")
         {
            §§push(2);
            break;
         }
         if(_loc1_ == "B")
         {
            §§push(1);
            break;
         }
         §§push(7);
         break;
      case 5:
         if(_loc1_ == "A")
         {
            §§push(3);
            break;
         }
         if(_loc1_ == "B")
         {
            §§push(7);
            break;
         }
         §§push(1);
         break;
      case 6:
         if(_loc1_ == "A")
         {
            §§push(7);
            break;
         }
         if(_loc1_ == "B")
         {
            §§push(3);
            break;
         }
         §§push(2);
         break;
      case 7:
         if(_loc1_ == "A")
         {
            §§push(6);
            break;
         }
         if(_loc1_ == "A")
         {
            §§push(5);
            break;
         }
         §§push(4);
         break;
   }
   _loc0_ = §§pop();
   _loc1_ = §§pop();
   return _loc0_;
});
§§push(function showCard(pageNb)
{
   pageNbrTxt.text = pageNb;
   var firstItem = (pageNb - 1) * 10;
   var i = 0;
   while(i < 10)
   {
      var targetItem = eval("card" + i);
      var targetSelect = eval("deck_card" + i);
      var targetBasket = eval("basket_card" + i);
      var cardPos = firstItem + i;
      if(cardPos < root.playerStats.card.length)
      {
         oWork = new Object();
         oWork = root.playerStats.card[cardPos];
         set(targetItem + ".cardDeck",oWork.deck);
         cardObj = root.findCardObj(oWork.id);
         set(targetItem + ".cardID",cardObj.id);
         set(targetSelect + ".cardPos",cardPos);
         set(targetBasket + ".cardPos",cardPos);
         set(targetSelect + ".myObj",cardObj);
         set(targetBasket + ".myObj",cardObj);
         targetItem.drawCard(cardObj);
         targetItem.glow._visible = false;
         targetItem.shade._visible = false;
         targetSelect._visible = targetBasket._visible = true;
         if(switchedActive == "A")
         {
            if(targetItem.cardDeck == 1 || targetItem.cardDeck == 4 || targetItem.cardDeck == 5 || targetItem.cardDeck == 7)
            {
               targetItem.glow._visible = true;
            }
            else
            {
               targetItem.shade._visible = true;
            }
         }
         else if(switchedActive == "B")
         {
            if(targetItem.cardDeck == 2 || targetItem.cardDeck == 4 || targetItem.cardDeck == 6 || targetItem.cardDeck == 7)
            {
               targetItem.glow._visible = true;
            }
            else
            {
               targetItem.shade._visible = true;
            }
         }
         else if(targetItem.cardDeck == 3 || targetItem.cardDeck == 5 || targetItem.cardDeck == 6 || targetItem.cardDeck == 7)
         {
            targetItem.glow._visible = true;
         }
         else
         {
            targetItem.shade._visible = true;
         }
         !targetItem.glow._visible?targetSelect.gotoAndStop(4):targetSelect.gotoAndStop(1);
         targetItem.shade._visible = !targetItem.glow._visible;
      }
      else
      {
         targetItem.hideCard();
         targetSelect._visible = targetBasket._visible = false;
      }
      i++;
   }
});
if(!root.sprAccess)
{
   spiderTabC.setTransform(darker);
   btn_spider.enabled = false;
}
var i = 0;
while(i < 10)
{
   var targetItem = eval("card" + i);
   var targetSelect = eval("deck_card" + i);
   var targetBasket = eval("basket_card" + i);
   targetItem.onRollOver = function()
   {
      cardShow.drawCard(this.myObj);
   };
   targetItem.onRollOut = function()
   {
      cardShow.hideCard();
   };
   targetSelect.onPress = function()
   {
      var _loc1_ = this;
      _loc1_._currentframe >= 4?_loc1_.gotoAndStop("click2"):_loc1_.gotoAndStop("click");
      _loc1_;
   };
   targetSelect.onRollOver = function()
   {
      var _loc1_ = this;
      cardShow.drawCard(_loc1_.myObj);
      _loc1_._currentframe >= 4?_loc1_.gotoAndStop("over2"):_loc1_.gotoAndStop("over");
      _loc1_;
   };
   targetSelect.onRollOut = function()
   {
      var _loc1_ = this;
      cardShow.hideCard();
      _loc1_._currentframe >= 4?_loc1_.gotoAndStop("idle2"):_loc1_.gotoAndStop("idle");
      _loc1_;
   };
   targetSelect.onRelease = function()
   {
      var _loc1_ = this;
      root.playerStats.card[_loc1_.cardPos].deck = _loc1_._parent.getDeckNbr(root.playerStats.card[_loc1_.cardPos].deck,switchedActive);
      _loc1_._parent.showCard(_loc1_._parent.pageNb);
      _loc1_;
   };
   targetBasket.onPress = function()
   {
      this.gotoAndStop("click");
   };
   targetBasket.onRollOver = function()
   {
      cardShow.drawCard(this.myObj);
      this.gotoAndStop("over");
   };
   targetBasket.onRollOut = function()
   {
      cardShow.hideCard();
      this.gotoAndStop("idle");
   };
   targetBasket.onRelease = function()
   {
      var _loc2_ = this;
      root.charWindow.tempDelCard = _loc2_.cardPos;
      var _loc1_ = function()
      {
         trace("END FC");
         root.askWindow.closeWindow();
         root.refreshDeck("delete",root.playerStats.card[root.charWindow.tempDelCard],root.playerStats.card[root.charWindow.tempDelCard]);
         root.playerStats.card.splice(root.charWindow.tempDelCard,1);
         root.setDeckOrder();
         newQty = Number(cardQty.text);
         newQty--;
         cardQty.text = newQty;
         root.charWindow.showCard(root.charWindow.pageNb);
         delete root.charWindow.tempDelCard;
      };
      _loc2_.gotoAndStop("idle");
      root.askWindow.drawWindow([root.getInsName("txtThrowAw",root.parseKitSheets)],_loc1_);
      _loc2_.gotoAndStop("idle");
      _loc2_;
      _loc1_;
   };
   i++;
}
pageNb = 1;
if(root.showText3)
{
   root.showText3 = 0;
   endFct = function()
   {
      root.textWindow.closeWindow();
      delete endFct;
   };
   root.textWindow.drawWindow([root.getInsName("txtLookCards",root.parseKitSheets)],0,endFct);
}
