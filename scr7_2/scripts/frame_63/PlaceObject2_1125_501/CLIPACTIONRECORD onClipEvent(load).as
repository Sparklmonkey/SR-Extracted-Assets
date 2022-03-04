onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle5 = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 301;
      ennemyStats.spider = null;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         if(game.char._y + game.offsetIsoY > game.zoneBuzz._y)
         {
            game.moveChar([game.getTileInfo(33,45)]);
         }
         else
         {
            game.moveChar([game.getTileInfo(25,37)]);
         }
         if(battleResult)
         {
            game.battle5 = 2;
            game.itemContainer.buzzbit1._visible = false;
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.battle5 = 0;
            game.registerWalkZone(game.zoneBuzz);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   if(game.battle5 < 1)
   {
      game.registerWalkZone(this);
   }
}
