onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle1 = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 100;
      ennemyStats.spider = null;
      var _loc1_ = 1;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         if(battleResult)
         {
            game.btnContainer.level0.t_0_3_12._visible = true;
            game.btnContainer.level0.t_0_3_11._visible = true;
            game.battle1 = 2;
            game.bkgDoor1.gotoAndStop(1);
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.moveChar([game.getTileInfo(23,13)]);
            game.battle1 = 0;
            game.registerWalkZone(game.zone1_3);
         }
         root.sfx.gotoAndPlay("music1");
      };
   };
   if(game.battle1 < 1)
   {
      game.registerWalkZone(this);
   }
}
