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
         if(game.char._y + game.offsetIsoY > game.zoneInvectid2._y)
         {
            game.moveChar([game.getTileInfo(33,37)]);
         }
         else
         {
            game.moveChar([game.getTileInfo(29,31)]);
         }
         if(battleResult)
         {
            game.battle4B = game.battle4B + 1;
            game.itemContainer.soldier2._visible = false;
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.registerWalkZone(game.zoneInvectid2);
         }
      };
   };
   if(game.battle4B < 1)
   {
      game.registerWalkZone(this);
   }
}
