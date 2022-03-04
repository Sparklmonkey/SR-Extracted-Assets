onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle3 = 2;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 101;
      ennemyStats.card = [];
      ennemyStats.dice = 0;
      ennemyStats.defense = 3;
      ennemyStats.action = 0;
      ennemyStats.life = 8;
      ennemyStats.victory = 16;
      ennemyStats.spider = null;
      var _loc1_ = 3;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(13,33)]);
         if(battleResult)
         {
            game.battle3 = 2;
            game.bkgDoor2.gotoAndStop(1);
            root.playerStats.victory += ptsVictory;
            game.setInstantBtn(0,13,4);
            game.setInstantBtn(0,14,4);
            game.registerWalkZone(game.zoneTransit);
            delete fct;
         }
         else
         {
            game.battle3 = 0;
            game.registerWalkZone(game.zone3_3);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   if(game.battle3 < 1)
   {
      game.registerWalkZone(this);
   }
}
