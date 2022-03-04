onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle3 = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 608;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(21,37)]);
         if(battleResult)
         {
            game.battlePart = game.battlePart + 1;
            game.battle3 = 2;
            game.core = 1;
            root.playerStats.victory += ptsVictory;
            delete endFct;
         }
         else
         {
            game.battle3 = 0;
            game.registerWalkZone(game.invectidBattle2);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   if(game.battle3 < 1)
   {
      game.registerWalkZone(this);
   }
}
