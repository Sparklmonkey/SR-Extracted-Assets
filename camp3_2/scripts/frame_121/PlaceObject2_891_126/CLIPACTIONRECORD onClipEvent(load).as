onClipEvent(load){
   _visible = false;
   fct = function()
   {
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
            root.playerStats.victory += ptsVictory;
            game.battleZone3.fct();
         }
         else
         {
            game.registerWalkZone(game.beerainZone);
            root.sfx.gotoAndPlay("music2");
            game.moveChar([game.getTileInfo(23,33)]);
         }
      };
   };
}
