function setScene(playerName, bkg)
{
   sceneNum = bkg;
   if(!firstPlyr)
   {
      gotoAndStop("multiScene" + sceneNum);
   }
}
function setGameEnd(disConnect)
{
   closeGame();
   accuracy = Math.floor(numKill / numShot * 100);
   if(accuracy == undefined)
   {
      accuracy = 0;
   }
   accuracy += " %";
   var _loc1_ = new Object();
   _loc1_.Name = root.playerStats.Name;
   _loc1_.Pts = score;
   _loc1_.Misc = accuracy;
   _loc1_.winner = true;
   if(varGame == "single")
   {
      root.mGameEndWindow.drawWindow(new Array(_loc1_),gameID);
   }
   else if(disConnect)
   {
      var _loc2_ = new Object();
      _loc2_.Name = root.getInsName("txtDisconnect",root.parseKitMGames);
      _loc2_.Pts = 0;
      _loc2_.Misc = "0 %";
      _loc2_.winner = false;
      root.mGameEndWindow.drawWindow(new Array(_loc1_,_loc2_),gameID);
   }
   else
   {
      root.gameSO.send("throwEndGame",_loc1_);
   }
}
function setWinner(obj1)
{
   var _loc2_ = obj1;
   if(_loc2_.Name != root.playerStats.Name)
   {
      closeGame();
      var _loc1_ = new Object();
      _loc1_.Name = root.playerStats.Name;
      _loc1_.Pts = score;
      _loc1_.Misc = accuracy;
      root.gameSO.send("throwEndGame",_loc1_);
      if(_loc2_.Pts > _loc1_.Pts)
      {
         _loc2_.winner = true;
         _loc1_.winner = false;
      }
      else
      {
         _loc2_.winner = false;
         _loc1_.winner = true;
      }
      root.mGameEndWindow.drawWindow(new Array(_loc2_,_loc1_),gameID);
   }
}
_global.mg3 = this;
varGame = new String();
firstPlyr = false;
secondPlyr = false;
output = new String();
init = undefined;
gameID = 3;
sceneNum = 0;
playerDesc = new Object();
drawGame = function(gameType)
{
   varGame = gameType;
   root.sfx.gotoAndPlay("battleRider");
   if(varGame == "multi")
   {
      setPos(playerDesc);
      if(firstPlyr)
      {
         root.gameSO.send("sendScene",root.playerStats.Name,sceneNum);
      }
   }
   else
   {
      firstPlyr = true;
   }
   gotoAndStop("init");
   play();
};
setPos = function(obj)
{
   if(obj[0].n == root.playerStats.Name)
   {
      sceneNum = random(3) + 1;
      firstPlyr = true;
   }
   else
   {
      secondPlyr = true;
   }
};
closeGame = function()
{
   delete this.onEnterFrame;
   Mouse.show();
   _quality = "MEDIUM";
   Mouse.removeListener(mouseListener);
   root.sfx.gotoAndPlay(game.ContxtMusic);
   sfx.gotoAndStop("stopTheme");
   gotoAndStop(1);
};
unPause = function()
{
   Mouse.hide();
   levelReady = true;
};
disConnect = function()
{
   output.text = "disconnect \n";
   setGameEnd(true);
};
setGameDesc = function(gameDesc)
{
   playerDesc = gameDesc;
};
stop();
