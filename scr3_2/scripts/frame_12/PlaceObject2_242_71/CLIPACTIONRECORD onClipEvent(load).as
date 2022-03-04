onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle3 = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 100;
      ennemyStats.card = [];
      ennemyStats.dice = 0;
      ennemyStats.defense = 2;
      ennemyStats.action = 0;
      ennemyStats.life = 2;
      ennemyStats.victory = 4;
      ennemyStats.spider = null;
      var _loc1_ = 1;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         if(battleResult)
         {
            game.btnContainer.level3.t_3_11_4._visible = true;
            game.btnContainer.level3.t_3_10_4._visible = true;
            game.battle3 = 2;
            game.bkgDoor3.gotoAndStop(1);
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.moveChar([game.getTileInfo(17,21)]);
            game.battle3 = 0;
            game.registerWalkZone(game.zone2_5);
         }
         root.sfx.gotoAndPlay("music3");
      };
   };
   if(game.battle3 < 1)
   {
      game.registerWalkZone(game.zone2_5);
   }
}
