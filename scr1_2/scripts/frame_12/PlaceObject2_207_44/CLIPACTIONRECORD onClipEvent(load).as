onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 100;
      var _loc1_ = 1;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(35,29)]);
         if(battleResult)
         {
            root.playerStats.victory += ptsVictory;
            game.battle1 = 1;
            game.bkgPorte.gotoAndStop(1);
            game.setInstantBtn(11,7,12);
            game.setInstantBtn(11,7,13);
            game.registerWalkZone(game.zoneTransit);
            game.openPath2();
            delete fct;
         }
         else
         {
            game.battle1 = 0;
            game.registerWalkZone(game.zoneBattle);
         }
         root.sfx.gotoAndPlay("music1");
      };
   };
   if(game.battle1 < 1)
   {
      game.registerWalkZone(this);
   }
}
