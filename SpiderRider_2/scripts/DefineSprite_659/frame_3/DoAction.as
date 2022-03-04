function showCard(pageNb, ID)
{
   var txtField = eval(ID + "_pageNbr");
   txtField.text = pageNb;
   var firstItem = (pageNb - 1) * 9;
   var i = 0;
   while(i < 9)
   {
      var targetItem = eval(ID + "_card" + i);
      var cardPos = firstItem + i;
      set(targetItem + ".serverID",ID);
      set(targetItem + ".cardPos",cardPos);
      if(cardPos < this.gameDesc[ID - 1].card.length)
      {
         oWork = new Object();
         oWork = this.gameDesc[ID - 1].card[cardPos];
         cardObj = root.findCardObj(oWork.id);
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
   var i = 0;
   while(i < 9)
   {
      var targetItem = eval(ID + "_blocker" + i);
      var targetItem2 = eval(ID + "_card" + i);
      targetItem._visible = false;
      var j = 0;
      while(j < 3)
      {
         var targetItem3 = eval(ID + "_offer" + j);
         if(!targetItem._visible)
         {
            targetItem._visible = targetItem2.cardPos == targetItem3.cardPos;
            j++;
            continue;
         }
         break;
      }
      i++;
   }
   var targetTxt = eval(ID + "_value");
   targetTxt.text = updateValue(ID);
}
function updateValue(ID)
{
   var crntValue = 0;
   var i = 0;
   while(i < 3)
   {
      var newTarget = eval(ID + "_offer" + i);
      if(newTarget.occupied)
      {
         var tempCost = String(newTarget.myObj.cost).split("g");
         crntValue = crntValue + Number(tempCost[0]);
      }
      i++;
   }
   return crntValue;
}
function sendSwitchTurn(switchDesc)
{
   popWait.gotoAndStop(popWait._totalframes - 1);
   root.gameSO.send("switchTurn",switchDesc);
}
function loadSwitchTurn(switchDesc)
{
   popWait.gotoAndStop(1);
   setToken();
   trace("loadSwitchTurn");
   trace(switchDesc);
   if(switchDesc != "" && switchDesc[0].length > 0 && switchDesc[1].length > 0)
   {
      var i = 0;
      while(i < 3)
      {
         var j = 1;
         while(j < 3)
         {
            var newTarget = eval(j + "_offer" + i);
            trace(newTarget);
            trace(switchDesc[j - 1][i]);
            if(switchDesc[j - 1][i] != undefined)
            {
               newTarget.occupied = true;
               newTarget.cardPos = switchDesc[j - 1][i].cardPos;
               newTarget.drawCard(switchDesc[j - 1][i].cardObj);
            }
            else
            {
               newTarget.occupied = false;
               newTarget.cardPos = -1;
               newTarget.hideCard();
            }
            j++;
         }
         i++;
      }
      showCard(pageNb1,1);
      showCard(pageNb2,2);
      updateValue(1);
      updateValue(2);
      offerBtn.gotoAndStop(2);
   }
   else
   {
      offerBtn.gotoAndStop(1);
   }
}
function gatherSwitchDesc()
{
   clearInterval(mainInterval);
   var switchDesc = new Array(new Array(),new Array());
   var i = 0;
   while(i < 3)
   {
      var j = 1;
      while(j < 3)
      {
         var newTarget = eval(j + "_offer" + i);
         if(newTarget.occupied)
         {
            switchDesc[j - 1].push({cardObj:newTarget.myObj,cardPos:newTarget.cardPos});
         }
         j++;
      }
      i++;
   }
   if(switchDesc[0].length > 0 && switchDesc[1].length > 0)
   {
      sendSwitchTurn(switchDesc);
   }
}
function setToken()
{
   trace("SET TOKEN");
   tokenID = tokenID != 1?1:2;
   trace("TOKEN IN POSSESSION OF: " + tokenID);
   if(tokenID == myID)
   {
      trace("MY TOKEN");
      root.textWindow.drawWindow([root.getInsName("txtYouControl",root.parseKitVisual)],0,root.textWindow.closeWindow);
   }
   else
   {
      trace("OTHER PLAYER\'S TOKEN");
      popWait.drawWindow(this.gameDesc[otherID - 1].n);
   }
   trace("MY ID IS: " + myID);
}
function sendQuitModule()
{
   root.gameSO.send("quitModule",root.playerStats.Name);
}
function sendAnswerOffer(answer)
{
   root.gameSO.send("answerOffer",answer);
}
function loadAnswerOffer(answer)
{
   if(answer)
   {
      var tempTradeArr1 = new Array();
      var tempTradeArr2 = new Array();
      var i = 0;
      while(i < 3)
      {
         var newTarget = eval(myID + "_offer" + i);
         if(newTarget.occupied)
         {
            tempTradeArr1.push(newTarget.myObj.id);
         }
         var newTarget2 = eval(otherID + "_offer" + i);
         if(newTarget2.occupied)
         {
            tempTradeArr2.push(newTarget2.myObj.id);
         }
         i++;
      }
      root.completeCardTrade(new Array(tempTradeArr1,tempTradeArr2));
      popWait.drawMsg(root.getInsName("msgTradAccpt",root.parseKitCards));
   }
   else
   {
      offerBtn.gotoAndStop(1);
   }
}
p1Confirmed = p2Confirmed = tradeHasStarted = false;
protectBtn.enabled = false;
txtTrade.text = root.getInsName("txtTrade",root.parseKitVisual);
txtPageA.text = root.getInsName("txtPage",root.parseKitVisual);
txtPageB.text = root.getInsName("txtPage",root.parseKitVisual);
txtValueA.text = root.getInsName("txtValue",root.parseKitVisual);
txtValueB.text = root.getInsName("txtValue",root.parseKitVisual);
this["1_playerDesc"].desc = {sx:this.gameDesc[0].sx,e:this.gameDesc[0].e,sk:this.gameDesc[0].sk,h:this.gameDesc[0].h};
this["2_playerDesc"].desc = {sx:this.gameDesc[1].sx,e:this.gameDesc[1].e,sk:this.gameDesc[1].sk,h:this.gameDesc[1].h};
this["1_nameTxt"].text = this.gameDesc[0].n;
this["2_nameTxt"].text = this.gameDesc[1].n;
myID = this.gameDesc[0].n != root.playerStats.Name?2:1;
otherID = this.gameDesc[0].n != root.playerStats.Name?1:2;
tokenID = 1;
pageNb1 = pageNb2 = 1;
frameCall = 8;
this.onEnterFrame = function()
{
   if(frameCall > 0)
   {
      frameCall--;
   }
   else
   {
      trace("FRAME CALL");
      delete this.onEnterFrame;
      delete frameCall;
      showCard(pageNb1,1);
      showCard(pageNb2,2);
      root.tradeWindow.confirmTradeStart(root.playerStats.Name);
      root.gameSO.send("confirmTradeStart",root.playerStats.Name);
   }
};
var i = 0;
while(i < 3)
{
   var j = 1;
   while(j < 3)
   {
      var targetItem = eval(j + "_offer" + i);
      set(targetItem + ".occupied",false);
      set(targetItem + ".cardPos",-1);
      set(targetItem + ".serverID",j);
      targetItem.hideCard();
      targetItem.onRollOver = function()
      {
         cardShow.drawCard(this.myObj);
      };
      targetItem.onRollOut = function()
      {
         cardShow.hideCard();
      };
      targetItem.onRelease = function()
      {
         var _loc1_ = this;
         §§push(_loc1_);
         if(offerBtn._currentframe < 2)
         {
            if(_loc1_.occupied)
            {
               _loc1_.occupied = false;
               _loc1_.cardPos = -1;
               _loc1_.hideCard();
               _loc1_.serverID != 1?showCard(pageNb2,2):showCard(pageNb1,1);
            }
         }
         _loc1_ = §§pop();
      };
      j++;
   }
   i++;
}
var i = 0;
while(i < 9)
{
   var j = 1;
   while(j < 3)
   {
      var targetItem = eval(j + "_card" + i);
      set(targetItem + ".serverID",j);
      targetItem.onRollOver = function()
      {
         cardShow.drawCard(this.myObj);
      };
      targetItem.onRollOut = function()
      {
         cardShow.hideCard();
      };
      targetItem.onRelease = function()
      {
         if(offerBtn._currentframe < 2)
         {
            var noClick = false;
            var k = 0;
            while(k < 3)
            {
               var newTarget = eval(this.serverID + "_offer" + k);
               if(this.cardPos == newTarget.cardPos)
               {
                  noClick = true;
                  break;
               }
               k++;
            }
            if(!noClick)
            {
               var k = 0;
               while(k < 3)
               {
                  var newTarget = eval(this.serverID + "_offer" + k);
                  if(!newTarget.occupied)
                  {
                     newTarget.occupied = true;
                     newTarget.cardPos = this.cardPos;
                     newTarget.drawCard(this.myObj);
                     this.serverID != 1?showCard(pageNb2,2):showCard(pageNb1,1);
                     break;
                  }
                  k++;
               }
            }
         }
      };
      j++;
   }
   i++;
}
stop();
