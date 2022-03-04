onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle8 = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 400;
      ennemyStats.card = [];
      ennemyStats.dice = 9;
      ennemyStats.defense = 3;
      ennemyStats.action = 0;
      ennemyStats.life = 9;
      ennemyStats.victory = 27;
      ennemyStats.spider = null;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(23,39)]);
         if(battleResult)
         {
            game.battle8 = 2;
            game.itemContainer.soldier3._visible = false;
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.battle8 = 0;
            game.registerWalkZone(game.zoneInvectid6);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   if(game.battle8 < 1)
   {
      game.registerWalkZone(this);
   }
}
