_global.mg1 = this;
drawGame = function(gameType)
{
   var _loc1_ = gameType;
   this.gameType = _loc1_;
   if(_loc1_ == "multi")
   {
      playerID = this.gameDesc[0].n != root.playerStats.Name ? 2 : 1;
   }
   else
   {
      playerID = 1;
   }
   gotoAndStop("init");
};
closeGame = function()
{
   _quality = "MEDIUM";
   gotoAndStop(1);
};
unPause = function()
{
   this.onEnterFrame = function()
   {
      if(!gameOver)
      {
         work();
      }
      else
      {
         showResults(false);
      }
   };
};
disConnect = function(playerName)
{
   var _loc2_ = this;
   var _loc3_ = playerName;
   delete _loc2_.onEnterFrame;
   gameOver = true;
   var _loc1_ = 0;
   while(_loc1_ < 9)
   {
      _loc2_["t1_" + _loc1_].gotoAndStop(1);
      _loc2_["1_" + _loc1_].gotoAndStop(1);
      _loc2_["t2_" + _loc1_].gotoAndStop(1);
      _loc2_["2_" + _loc1_].gotoAndStop(1);
      _loc1_ = _loc1_ + 1;
   }
   var winner1 = _loc3_ == root.playerStats.Name ? "disconnect" : true;
   var winner2 = _loc3_ == root.playerStats.Name ? "disconnect" : true;
   var pts1 = _loc3_ == root.playerStats.Name ? "" : Number(root["1_info"].scoreTxt.text);
   var pts2 = _loc3_ == root.playerStats.Name ? "" : Number(root["2_info"].scoreTxt.text);
   var obj1 = {Name:gameDesc[0].n,Pts:pts1,Misc:"",winner:winner1};
   var obj2 = {Name:gameDesc[1].n,Pts:pts2,Misc:"",winner:winner2};
   root.mGameEndWindow.drawWindow(new Array(obj1,obj2),1);
};
setGameDesc = function(gameDesc)
{
   this.gameDesc = gameDesc;
};
stop();
