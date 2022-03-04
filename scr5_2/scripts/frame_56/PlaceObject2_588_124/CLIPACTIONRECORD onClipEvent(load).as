onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle11 = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 301;
      ennemyStats.card = [];
      ennemyStats.dice = 5;
      ennemyStats.defense = 2;
      ennemyStats.action = 0;
      ennemyStats.life = 5;
      ennemyStats.victory = 15;
      ennemyStats.spider = null;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(33,51)]);
         if(battleResult)
         {
            game.openPath1();
            game.battle11 = 2;
            game.itemContainer.buzzBit2._visible = false;
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.battle11 = 0;
            game.registerWalkZone(game.zoneBuzz);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   if(game.battle11 < 1)
   {
      game.registerWalkZone(this);
   }
}
