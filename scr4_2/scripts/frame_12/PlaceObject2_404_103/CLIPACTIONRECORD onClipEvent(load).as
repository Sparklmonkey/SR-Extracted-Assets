onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 400;
      ennemyStats.spider = null;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,param);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         root.sfx.gotoAndPlay("music1");
         if(game.char._y + game.offsetIsoY > game.zoneInvectid1._y)
         {
            game.moveChar([game.getTileInfo(29,31)]);
         }
         else
         {
            game.moveChar([game.getTileInfo(21,29)]);
         }
         if(battleResult)
         {
            game.battle4A = game.battle4A + 1;
            game.itemContainer.soldier1._visible = false;
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.registerWalkZone(game.zoneInvectid1);
         }
      };
   };
   if(game.battle4A < 1)
   {
      game.registerWalkZone(this);
   }
}
