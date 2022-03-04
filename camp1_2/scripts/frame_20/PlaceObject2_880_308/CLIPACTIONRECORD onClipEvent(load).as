onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      root.textWindow.closeWindow();
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 309;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(31,31)]);
         if(battleResult)
         {
            game.battle1 = 1;
            root.playerStats.victory += ptsVictory;
            game.itemContainer.pinchpounce1._visible = false;
            delete fct;
         }
         else
         {
            game.battle1 = 0;
            game.registerWalkZone(this);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   if(game.battle1 < 1)
   {
      game.registerWalkZone(this);
   }
}
