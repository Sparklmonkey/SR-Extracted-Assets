onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle4 = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 201;
      ennemyStats.spider = null;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         if(game.char._x + game.offsetIsoX > game.zoneInvectid2._x)
         {
            game.moveChar([game.getTileInfo(35,39)]);
         }
         else
         {
            game.moveChar([game.getTileInfo(33,49)]);
         }
         if(battleResult)
         {
            game.battle4 = 2;
            game.itemContainer.poisonFlower2._visible = false;
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.battle4 = 0;
            game.registerWalkZone(game.zoneInvectid2);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   if(game.battle4 < 1)
   {
      game.registerWalkZone(this);
   }
}
