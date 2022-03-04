onClipEvent(load){
   _visible = false;
   fct = function()
   {
      ennemyStats = new Object();
      ennemyStats.type = 603;
      ennemyStats.card = new Array(100,101,102,102,104,201,202,204,302,302,502,503,503,504,504,508,508,506);
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
            game.battle6 = 1;
            game.gameTrigger = 3;
            game.registerWalkZone(game.magmaZone);
            game.registerWalkZone(game.igneousZone);
            game.registerDropZone(game.gateDropZone);
            game.itemContainer.beerain1._visible = false;
         }
         else
         {
            game.registerWalkZone(game.beerainZone);
            root.sfx.gotoAndPlay("music2");
            game.moveChar([game.getTileInfo(23,33)]);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
}
