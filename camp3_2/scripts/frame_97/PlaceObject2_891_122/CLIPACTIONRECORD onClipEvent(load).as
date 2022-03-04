onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 408;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         if(battleResult)
         {
            root.playerStats.victory += ptsVictory;
            game.battle1 = 1;
            game.itemContainer.grasshop1._visible = false;
            game.itemContainer.invectidDriver1._visible = false;
         }
         else
         {
            game.registerWalkZone(game.driverZone);
            game.battle1 = 0;
         }
         game.moveChar([game.getTileInfo(49,39)]);
         root.sfx.gotoAndPlay("music2");
      };
   };
}
