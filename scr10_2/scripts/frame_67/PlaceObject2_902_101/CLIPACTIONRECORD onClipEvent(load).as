onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle1 = 1;
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 301;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(31,35)]);
         if(battleResult)
         {
            game.itemContainer.buzzbit1._visible = false;
            game.battle1 = 2;
            game.trigger2 = 0;
            game.trigger3 = 1;
            game.placeObject(0,13,16,"corona",1);
            game.placeObject(0,13,19,"cardField",1);
            game.registerWalkZone(game.coronaZone);
            game.registerWalkZone(game.cardZone);
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.battle1 = 0;
            game.registerWalkZone(game.zoneBuzzbit1);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   if(game.battle1 < 1)
   {
      game.registerWalkZone(this);
   }
}
