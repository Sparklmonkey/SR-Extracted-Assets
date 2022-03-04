onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 405;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         if(battleResult)
         {
            game.battle4 = 1;
            root.playerStats.victory += ptsVictory;
            game.itemContainer.invectidDarkFlying1._visible = false;
         }
         else
         {
            game.battle4 = 0;
            game.registerWalkZone(game.darkFlyingZone);
         }
         root.sfx.gotoAndPlay("music2");
         game.moveChar([game.getTileInfo(23,29)]);
      };
   };
   if(game.battle4 < 1)
   {
      trace(game.battle4);
      game.registerWalkZone(this);
   }
}
