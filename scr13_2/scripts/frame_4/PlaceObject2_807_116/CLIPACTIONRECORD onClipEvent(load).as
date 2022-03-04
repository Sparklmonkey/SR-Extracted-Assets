onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle2 = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 607;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(39,33)]);
         if(battleResult)
         {
            game.battlePart = game.battlePart + 1;
            game.battle2 = 2;
            game.leftarm = 1;
            root.playerStats.victory += ptsVictory;
            delete endFct;
         }
         else
         {
            game.battle2 = 0;
            game.registerWalkZone(game.invectidBattle4);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   if(game.battle2 < 1)
   {
      game.registerWalkZone(this);
   }
}
