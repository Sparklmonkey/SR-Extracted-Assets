onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle6 = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 400;
      ennemyStats.spider = null;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(19,27)]);
         if(battleResult)
         {
            game.battle6 = 2;
            game.itemContainer.soldierA1._visible = false;
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.battle6 = 0;
            game.registerWalkZone(game.zoneInvectid1);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   if(game.battle6 < 1)
   {
      game.registerWalkZone(this);
   }
}
