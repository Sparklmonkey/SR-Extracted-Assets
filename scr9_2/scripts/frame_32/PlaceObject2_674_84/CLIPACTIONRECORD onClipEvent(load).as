onClipEvent(load){
   _visible = false;
   endFct2 = function()
   {
      root.textWindow.closeWindow();
      game.unregisterDropZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 500;
      ennemyStats.spider = null;
      ennemyStats.card = ["101","103","104","203","206","207","300","304","500","500","504","503"];
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         game.moveChar([game.getTileInfo(20,26)]);
         root.battleSystem.clearBattle();
         if(battleResult)
         {
            game.battleBoss = 1;
            root.playerStats.victory += ptsVictory;
            endFct3 = function()
            {
               root.gotoAndStop("level10");
               root.sfx.gotoAndPlay("winner");
               delete endFct3;
            };
            endFct3();
            game.removeObject("keyItem");
         }
         else
         {
            game.registerDropZone(game.fightZone);
            game.battleBoss = 0;
            root.sfx.gotoAndPlay("music3");
         }
      };
   };
   endFct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txtM9Z15_p1",root.parseKitMissions),root.getInsName("txtM9Z15_p2",root.parseKitMissions),root.getInsName("txtM9Z15_p3",root.parseKitMissions)],0,endFct2);
   };
   newObj = {lvl:0,j1:18,k1:28};
   newObj.fct = function()
   {
      game.Key = 2;
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      root.textWindow.drawWindow([root.getInsName("txtM9Z15_p4",root.parseKitMissions),root.getInsName("txtM9Z15_p5",root.parseKitMissions),root.getInsName("txtM9Z15_p6",root.parseKitMissions)],13,endFct);
   };
   fct = function(item)
   {
      if(item == "keyItem")
      {
         if(game.newTile.xtile == 18 && game.newTile.ytile == 28)
         {
            root.tweenStop = false;
            newObj.fct();
         }
         else
         {
            root.tweenStop = false;
            game.tileTriggered(newObj);
         }
      }
   };
   if(game.Key > 0)
   {
      game.registerDropZone(this);
   }
}
