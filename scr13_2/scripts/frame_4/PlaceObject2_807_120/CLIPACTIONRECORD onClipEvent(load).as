onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle4 = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      if(game.battlePart == 0)
      {
         ennemyStats.type = 609;
      }
      if(game.battlePart == 1)
      {
         ennemyStats.type = 610;
      }
      if(game.battlePart == 2)
      {
         ennemyStats.type = 611;
      }
      if(game.battlePart == 3)
      {
         ennemyStats.type = 612;
      }
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(35,47)]);
         if(battleResult)
         {
            game.battle1 = 2;
            game.battle2 = 2;
            game.battle3 = 2;
            game.battle4 = 2;
            game.unregisterWalkZone(game.invectidBattle1);
            game.unregisterWalkZone(game.invectidBattle2);
            game.unregisterWalkZone(game.invectidBattle4);
            game.unregisterDropZone(game.webZone);
            game.sparkle1._visible = false;
            game.sparkle2._visible = false;
            game.sparkle3._visible = false;
            game.monster._visible = false;
            root.playerStats.victory += ptsVictory;
            delete endFct;
         }
         else
         {
            game.battle4 = 0;
            game.registerWalkZone(game.invectidBattle3);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   if(game.battle4 < 1)
   {
      game.registerWalkZone(this);
   }
}
