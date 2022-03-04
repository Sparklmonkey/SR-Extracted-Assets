onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
         if(game.battleBoss < 2)
         {
            endFct2();
         }
      };
      endFct4 = function()
      {
         root.textWindow.closeWindow();
         root.gotoAndStop("level8");
      };
      endFct2 = function()
      {
         game.unregisterWalkZone(game.zoneCorona);
         root.sfx.gotoAndPlay("battleSystem");
         ennemyStats = new Object();
         ennemyStats.type = 404;
         ennemyStats.spider = null;
         var _loc1_ = 2;
         root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
         game._visible = false;
         root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
         {
            game._visible = true;
            root.battleSystem.clearBattle();
            game.moveChar([game.getTileInfo(33,29)]);
            if(battleResult)
            {
               game.battleBoss = 2;
               root.playerStats.victory += ptsVictory;
               root.textWindow.drawWindow([root.getInsName("txtM7Z23_p1",root.parseKitMissions)],0,endFct4);
            }
            else
            {
               game.registerWalkZone(game.zoneCorona);
               root.sfx.gotoAndPlay("music2");
            }
         };
      };
      game.text30 = 1;
      root.textWindow.drawWindow([root.getInsName("txtM7Z23_p2",root.parseKitMissions),root.getInsName("txtM7Z23_p3",root.parseKitMissions),root.getInsName("txtM7Z23_p4",root.parseKitMissions)],13,endFct);
      game.unregisterWalkZone(game.zoneCorona);
   };
   if(game.event8 == 1)
   {
      game.registerWalkZone(this);
   }
}
