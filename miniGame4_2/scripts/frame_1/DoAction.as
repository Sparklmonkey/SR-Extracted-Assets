drawGame = function(gameType)
{
   gotoAndStop("game");
   play();
};
closeGame = function()
{
   delete this.onEnterFrame;
   gotoAndStop(1);
};
unPause = function()
{
   gamePause = false;
};
showResults = function()
{
   closeGame();
   var _loc1_ = this.nScoreFinal;
   if(_loc1_ == undefined)
   {
      _loc1_ = 0;
   }
   var _loc2_ = {Name:root.playerStats.Name,Pts:_loc1_,Misc:"",winner:true};
   root.mGameEndWindow.drawWindow(new Array(_loc2_),4);
   gotoAndStop(1);
};
stop();
