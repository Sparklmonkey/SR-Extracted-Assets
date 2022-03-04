onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 613;
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
            game.battle4 = 1;
            game.placeObject(0,12,16,"holyBook",1);
            game.itemContainer.bugueseMonster1._visible = false;
            game.itemContainer.aquine1._visible = false;
            game.itemContainer.buguese1._visible = false;
            game.registerWalkZone(game.bookZone);
            game.registerWalkZone(game.teacherZone);
            game.registerWalkZone(game.magmaZone);
         }
         else
         {
            game.battle4 = 0;
            game.unregisterWalkZone(game.magmaZone);
            game.unregisterWalkZone(game.teacherZone);
            game.registerWalkZone(game.bugueseZone);
         }
         game.moveChar([game.getTileInfo(31,31)]);
         root.sfx.gotoAndPlay("music2");
      };
   };
}
