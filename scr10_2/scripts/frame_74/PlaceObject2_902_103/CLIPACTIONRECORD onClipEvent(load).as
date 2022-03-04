onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battleBoss = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 600;
      ennemyStats.card = ["103","201","203","503","503","506"];
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(31,35)]);
         if(battleResult)
         {
            game.battleBoss = 2;
            game.itemContainer.dungobee1._visible = false;
            root.playerStats.victory += ptsVictory;
            endFct2 = function()
            {
               root.textWindow.closeWindow();
               root.gotoAndStop("level11");
               delete endFct2;
            };
            root.textWindow.drawWindow([root.getInsName("txtM10Z21_p1",root.parseKitMissions)],0,endFct2);
            root.sfx.gotoAndPlay("winner");
            delete fct;
         }
         else
         {
            game.battleBoss = 0;
            game.registerWalkZone(game.zoneDungobee1);
            root.sfx.gotoAndPlay("music2");
         }
      };
   };
   if(game.battleBoss < 1)
   {
      game.registerWalkZone(this);
   }
}
