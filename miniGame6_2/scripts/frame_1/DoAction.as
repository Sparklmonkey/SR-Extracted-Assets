_global.mg6 = this;
drawGame = function(gameType)
{
   gotoAndStop("init");
   play();
};
closeGame = function()
{
   delete this.onEnterFrame;
   _quality = "HIGH";
   roundNum = 1;
   root.sfx.gotoAndPlay(game.ContxtMusic);
   gotoAndStop("close");
};
stop();
