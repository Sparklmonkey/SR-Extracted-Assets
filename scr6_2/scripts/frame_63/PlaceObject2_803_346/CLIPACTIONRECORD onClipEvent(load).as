onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      game.battle3 = 1;
      game.unregisterWalkZone(game.zoneInvectid1);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 400;
      ennemyStats.spider = null;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(41,29)]);
         if(battleResult)
         {
            game.battle3 = 2;
            game.itemContainer.soldierB1._visible = false;
            root.playerStats.victory += ptsVictory;
            delete endFct;
         }
         else
         {
            game.battle3 = 0;
            game.registerWalkZone(game.zoneInvectid1);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txtM6Z6_p1",root.parseKitMissions)],6,endFct);
   };
   if(game.battle3 < 1)
   {
      game.registerWalkZone(game.zoneInvectid1);
   }
}
