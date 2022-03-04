onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle9 = 1;
      game.unregisterWalkZone(game.nasty1);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 302;
      ennemyStats.card = [];
      ennemyStats.dice = 6;
      ennemyStats.defense = 3;
      ennemyStats.action = 0;
      ennemyStats.life = 6;
      ennemyStats.victory = 18;
      ennemyStats.spider = null;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(13,33)]);
         if(battleResult)
         {
            game.battle9 = 2;
            game.itemContainer.nasty1._visible = false;
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.battle9 = 0;
            game.registerWalkZone(game.nasty1);
         }
         root.sfx.gotoAndPlay("music1");
      };
   };
   if(game.battle9 < 1)
   {
      game.registerWalkZone(this);
   }
}
