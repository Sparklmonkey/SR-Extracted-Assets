onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle10 = 1;
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
         game.moveChar([game.getTileInfo(35,25)]);
         if(battleResult)
         {
            game.battle10 = 2;
            game.itemContainer.greatNasty1._visible = false;
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.battle10 = 0;
            game.registerWalkZone(game.zoneGreat);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   if(game.battle10 < 1)
   {
      game.registerWalkZone(this);
   }
}
