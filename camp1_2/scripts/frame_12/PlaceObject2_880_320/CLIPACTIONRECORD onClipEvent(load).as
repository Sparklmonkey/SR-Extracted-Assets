onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 601;
      ennemyStats.card = new Array(101,103,107,107,205,202,204,206,503,503,506,507,508,509,509,510);
      root.battleSystem.initBattle(ennemyStats,root.playerStats,2);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(33,21)]);
         if(battleResult)
         {
            game.battle6 = 1;
            game.gameTrigger = 4;
            root.playerStats.victory += ptsVictory;
            game.itemContainer.grasshop1._visible = false;
         }
         else
         {
            game.registerWalkZone(game.invectidZone);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
}
