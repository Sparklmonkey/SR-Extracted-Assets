_global.mg2 = this;
this.gameDesc = new Array();
drawGame = function(gameType)
{
   var _loc1_ = this;
   trace("DRAWING GAME MG2");
   _loc1_.gameType = gameType;
   if(_loc1_.gameType == "single")
   {
      _loc1_.gameDesc.push({n:"Igneous"},{n:"Magma"},{n:"Hunter"},{n:root.playerStats.Name,sx:root.typeSex,sk:root.typeSkin,h:root.typeHair,e:root.typeEyes});
      trace("sex = " + gameDesc[3].sx);
      trace("root.sex = " + root.typeSex);
      hasToken = true;
      gotoAndStop("sprSlct");
      play();
   }
   else if(hasToken)
   {
      gameTrack = random(3) + 1;
      ranSpider = random(3) + 1;
      root.gameSO.send("initMultiGame",gameTrack,ranSpider);
   }
   root.sfx.gotoAndPlay("battleRider");
};
setMultiGame = function(gameTrack, ranSpider)
{
   myTrack = gameTrack;
   mySpider = ranSpider;
   trace("setMultiGame   :" + myTrack + "  " + mySpider);
   gotoAndStop("engine");
   play();
};
setGameDesc = function(gameDesc)
{
   this.gameDesc = gameDesc;
   if(this.gameDesc[0].n == root.playerStats.Name)
   {
      hasToken = true;
   }
};
unPause = function()
{
   PAUSE = false;
};
throwEndGame = function(obj)
{
   if(obj.Name != root.playerStats.Name)
   {
      trace("throwEndGame");
      obj1 = new Object();
      switch(myPos)
      {
         case "0":
            score = 4000;
            winner = true;
            break;
         case "1":
            score = 2000;
            winner = false;
            break;
         default:
            score = 0;
            winner = false;
      }
      obj1.Name = root.playerStats.Name;
      obj1.Pts = score;
      obj1.Misc = "";
      obj1.winner = winner;
      this.gotoAndStop("close");
      root.mGameEndWindow.drawWindow(new Array(obj1,obj),2);
      closeGame();
   }
};
closeGame = function()
{
   delete this.onEnterFrame;
   clearInterval(timeInt);
   root.sfx.gotoAndPlay(game.ContxtMusic);
   _quality = "HIGH";
   clearInterval(posInterval);
   cleanAllScreen();
   trace("END GAME********************");
   this.gotoAndStop(1);
};
clearData = function(disConnect)
{
   var _loc1_ = this;
   obj1 = new Object();
   if(_loc1_.gameType == "single")
   {
      _loc1_.gotoAndStop("close");
      trace(myPos);
      switch(myPos)
      {
         case "0":
            score = 4000;
            winner = true;
            break;
         case "1":
            score = 2000;
            winner = false;
            break;
         case "2":
            score = 1000;
            winner = false;
            break;
         case "3":
            score = 800;
            winner = false;
            break;
         default:
            score = 0;
            winner = false;
      }
      bonus = 1000;
      malus = 0;
      malus += min * 100;
      malus += sec * 5;
      if(malus > 1000)
      {
         malus = 1000;
      }
      bonus -= malus;
      obj1.Name = root.playerStats.Name;
      obj1.Pts = score + bonus;
      obj1.Misc = "";
      obj1.winner = winner;
      trace(obj1.Pts);
      root.mGameEndWindow.drawWindow(new Array(obj1),2);
      closeGame();
   }
   else
   {
      trace("My FINAL Pos = " + myPos);
      switch(myPos)
      {
         case "0":
            score = 4000;
            winner = true;
            break;
         case "1":
            score = 2000;
            winner = false;
            break;
         default:
            score = 0;
            winner = false;
      }
      obj1.Name = root.playerStats.Name;
      if(disConnect)
      {
         obj1.Pts = 1000;
         obj1.Misc = "";
         obj1.winner = true;
         obj2 = new Object();
         obj2.Name = "Disconnected";
         obj2.Pts = 0;
         obj2.Misc = "";
         obj2.winner = false;
         root.mGameEndWindow.drawWindow(new Array(obj1,obj2),2);
         trace("MG2 DISCONNECTED!!!!!!!!!");
      }
      else
      {
         obj1.Pts = score;
         obj1.Misc = "";
         obj1.winner = winner;
         trace("Send the stats");
         root.gameSO.send("setEndStat",obj1);
      }
      _loc1_.gotoAndStop("close");
   }
};
disConnect = function()
{
   clearData(true);
};
stop();
