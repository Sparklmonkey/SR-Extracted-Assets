onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle13 = 1;
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
         game.moveChar([game.getTileInfo(27,35)]);
         if(battleResult)
         {
            game.battle13 = 2;
            game.itemContainer.poisonFlower2._visible = false;
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.battle13 = 0;
            game.registerWalkZone(game.zoneFlw2);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   if(game.battle13 < 1)
   {
      game.registerWalkZone(this);
   }
}
