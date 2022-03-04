_global.mg5 = this;
drawGame = function(gameType)
{
   gotoAndStop("init");
   play();
};
throwEndGame = function(winGame)
{
   obj1 = new Object();
   obj1.Name = root.playerStats.Name;
   obj1.Pts = score;
   obj1.Misc = "";
   obj1.winner = winner;
   gameID = 5;
   closeGame();
   root.mGameEndWindow.drawWindow(new Array(obj1),gameID);
};
closeGame = function()
{
   clearGame();
   gotoAndStop("load");
};
unPause = function()
{
   bossInt = setInterval(mc_progress.moveMiniChar,1000);
   intID = setInterval(healthDecay,1000);
   Mouse.hide();
   Mouse.addListener(mouseListener);
   PAUSE = false;
};
clearGame = function()
{
   delete this.onEnterFrame;
   char.char.stop();
   char.char.char.stop();
   clearInterval(intID);
   clearInterval(flashInt);
   clearInterval(bossInt);
   Mouse.show();
   Mouse.removeListener(mouseListener);
   root.sfx.gotoAndPlay(game.ContxtMusic);
   _quality = "HIGH";
};
stop();
