onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle1 = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 606;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(15,35)]);
         if(battleResult)
         {
            game.battlePart = game.battlePart + 1;
            game.battle1 = 2;
            game.rightarm = 1;
            root.playerStats.victory += ptsVictory;
            delete endFct;
         }
         else
         {
            game.battle1 = 0;
            game.registerWalkZone(game.invectidBattle1);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   if(game.battle1 < 1)
   {
      game.registerWalkZone(this);
   }
}
