drawGame = function()
{
   trace("WAITING FOR OTHER USER TO START TRADE MODULE");
   setTradersCards(root.playerStats.Name,root.playerStats.card);
   root.gameSO.send("setTradersCards",root.playerStats.Name,root.playerStats.card);
   gotoAndStop("loading");
};
closeGame = function()
{
   gotoAndStop(1);
};
unPause = function()
{
};
setGameDesc = function(gameDesc)
{
   var _loc1_ = this;
   _loc1_.gameDesc = gameDesc;
   _loc1_.gameDesc[0].card = new Array("null");
   _loc1_.gameDesc[1].card = new Array("null");
   _loc1_;
};
setTradersCards = function(Name, deck)
{
   var _loc1_ = this;
   _loc1_.gameDesc[0].n != Name?_loc1_.gameDesc[1].card = deck:_loc1_.gameDesc[0].card = deck;
   trace("setTradersCards");
   §§push(_loc1_);
   if(_loc1_.gameDesc[0].card[0] != "null" && _loc1_.gameDesc[1].card[0] != "null")
   {
      trace("LOAD TRADE WINDOW");
      gotoAndStop("show");
   }
   _loc1_ = §§pop();
};
confirmTradeStart = function(Name)
{
   var _loc1_ = this;
   _loc1_.gameDesc[0].n != Name?p2Confirmed = true:p1Confirmed = true;
   trace("confirmTradeStart: p1Confirmed is " + p1Confirmed + " & p2Confirmed " + p2Confirmed);
   §§push(_loc1_);
   if(p1Confirmed && p2Confirmed)
   {
      p1Confirmed = p2Confirmed = false;
      tradeHasStarted = true;
      if(_loc1_.gameDesc[0].n == root.playerStats.Name)
      {
         root.textWindow.drawWindow([root.getInsName("txtYouControl",root.parseKitVisual)],0,root.textWindow.closeWindow);
      }
      else
      {
         popWait.drawWindow(_loc1_.gameDesc[otherID - 1].n);
      }
   }
   _loc1_ = §§pop();
};
stop();
