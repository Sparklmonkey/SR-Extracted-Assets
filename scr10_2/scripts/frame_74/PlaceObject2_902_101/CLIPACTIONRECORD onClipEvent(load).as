onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle2 = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 301;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(31,35)]);
         if(battleResult)
         {
            game.battle2 = 2;
            game.itemContainer.buzzbit1._visible = false;
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.battle2 = 0;
            game.registerWalkZone(game.zoneBuzzbit3);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   if(game.battle2 < 1)
   {
      game.registerWalkZone(this);
   }
}
