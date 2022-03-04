onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle4 = 1;
      game.unregisterWalkZone(game.zone3_1);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 200;
      ennemyStats.card = [];
      ennemyStats.dice = 6;
      ennemyStats.defense = 4;
      ennemyStats.action = 0;
      ennemyStats.life = 1;
      ennemyStats.victory = 8;
      ennemyStats.spider = null;
      var _loc1_ = 3;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(31,9)]);
         if(battleResult)
         {
            game.battle4 = 2;
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.battle4 = 0;
            game.registerWalkZone(game.zone3_1);
         }
         root.sfx.gotoAndPlay("music3");
      };
   };
   if(game.battle4 < 1)
   {
      game.registerWalkZone(game.zone3_1);
   }
}
