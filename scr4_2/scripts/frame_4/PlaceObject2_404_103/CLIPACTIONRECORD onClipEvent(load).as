onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle3 = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 301;
      ennemyStats.card = [];
      ennemyStats.dice = 5;
      ennemyStats.defense = 2;
      ennemyStats.action = 0;
      ennemyStats.life = 5;
      ennemyStats.victory = 15;
      ennemyStats.spider = null;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(31,19)]);
         if(battleResult)
         {
            game.openPath1();
            game.battle3 = 2;
            game.itemContainer.buzzBit3._visible = false;
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.battle3 = 0;
            game.registerWalkZone(game.zoneBuzz);
         }
         root.sfx.gotoAndPlay("music1");
      };
   };
   if(game.battle3 < 1)
   {
      game.registerWalkZone(this);
   }
}
