onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 306;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,2);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(33,21)]);
         if(battleResult)
         {
            game.battle5 = 1;
            root.playerStats.victory += ptsVictory;
            game.itemContainer.pinchmite1._visible = false;
         }
         else
         {
            game.registerWalkZone(this);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   if(game.battle5 < 1)
   {
      game.registerWalkZone(this);
   }
}
