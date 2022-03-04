onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle2 = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 201;
      ennemyStats.card = [];
      ennemyStats.dice = 10;
      ennemyStats.defense = 2;
      ennemyStats.action = 0;
      ennemyStats.life = 1;
      ennemyStats.victory = 8;
      ennemyStats.spider = null;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(43,33)]);
         if(battleResult)
         {
            game.battle2 = 2;
            game.itemContainer.poisonFlower22._visible = false;
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.battle2 = 0;
            game.registerWalkZone(game.zoneFlw2);
         }
         root.sfx.gotoAndPlay("music1");
      };
   };
   if(game.battle2 < 1)
   {
      game.registerWalkZone(this);
   }
}
