onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle2 = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 300;
      ennemyStats.card = [];
      ennemyStats.dice = 4;
      ennemyStats.defense = 2;
      ennemyStats.action = 0;
      ennemyStats.life = 2;
      ennemyStats.victory = 6;
      ennemyStats.spider = null;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(43,27)]);
         if(battleResult)
         {
            game.battle2 = 2;
            game.itemContainer.bat4._visible = false;
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.battle2 = 0;
            game.registerWalkZone(game.zone2_3);
         }
         root.sfx.gotoAndPlay("music3");
      };
   };
   if(game.battle2 < 1)
   {
      game.registerWalkZone(game.zone2_3);
   }
}
