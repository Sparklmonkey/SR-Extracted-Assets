onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 400;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,2);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(33,21)]);
         if(battleResult)
         {
            root.playerStats.victory += ptsVictory;
            game.itemContainer.invectidSoldier1._visible = false;
            game.battleZone2.fct();
         }
         else
         {
            game.registerWalkZone(game.invectidZone);
            root.sfx.gotoAndPlay("music2");
         }
      };
   };
}
