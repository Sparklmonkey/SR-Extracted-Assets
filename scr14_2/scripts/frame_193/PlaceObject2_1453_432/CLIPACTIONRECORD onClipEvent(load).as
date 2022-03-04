onClipEvent(load){
   _visible = false;
   if(game.trigger6 == 1)
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         root.sfx.gotoAndPlay("battleSystem");
         ennemyStats = new Object();
         ennemyStats.type = 317;
         var _loc1_ = 2;
         root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
         game._visible = false;
         root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
         {
            game._visible = true;
            root.battleSystem.clearBattle();
            game.moveChar([game.getTileInfo(37,27)]);
            if(battleResult)
            {
               game.battle1 = 2;
               root.playerStats.victory += ptsVictory;
               game.trigger6 = 0;
               game.trigger7 = 1;
               delete endFct;
            }
            else
            {
               game.battle1 = 0;
               game.registerWalkZone(game.krailBattle);
            }
            root.sfx.gotoAndPlay("music2");
         };
      };
      fct = function()
      {
         game.battle1 = 1;
         game.unregisterWalkZone(this);
         root.textWindow.drawWindow([root.getInsName("txtM14Z30_p1",root.parseKitMissions)],0,endFct);
      };
      if(game.battle1 < 1)
      {
         game.registerWalkZone(this);
      }
   }
}
