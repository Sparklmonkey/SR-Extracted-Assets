onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle6 = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 303;
      ennemyStats.card = [];
      ennemyStats.dice = 7;
      ennemyStats.defense = 4;
      ennemyStats.action = 0;
      ennemyStats.life = 7;
      ennemyStats.victory = 21;
      ennemyStats.spider = null;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(21,35)]);
         if(battleResult)
         {
            game.battle6 = 2;
            game.itemContainer.greatNasty3._visible = false;
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.battle6 = 0;
            game.registerWalkZone(game.zoneGreatTat);
         }
         root.sfx.gotoAndPlay("music1");
      };
   };
   if(game.battle6 < 1)
   {
      game.registerWalkZone(this);
   }
}
