onClipEvent(load){
   var posY = this._y;
   _visible = false;
   fct = function()
   {
      game.battle13 = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 401;
      ennemyStats.spider = null;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(35,49)]);
         if(battleResult)
         {
            game.battle13 = 2;
            game.itemContainer.flyingA3._visible = false;
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.battle13 = 0;
            game.registerWalkZone(game.zoneInvectid3);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   if(game.battle13 < 1)
   {
      game.registerWalkZone(this);
   }
}
