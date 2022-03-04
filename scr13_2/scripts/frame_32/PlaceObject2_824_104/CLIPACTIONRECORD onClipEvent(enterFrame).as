onClipEvent(enterFrame){
   _visible = false;
   if(game.action1 == 1)
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         root.sfx.gotoAndPlay("battleSystem");
         ennemyStats = new Object();
         ennemyStats.type = 601;
         ennemyStats.card = ["103","203","203","506","506","507","508"];
         var _loc1_ = 2;
         root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
         game._visible = false;
         root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
         {
            game._visible = true;
            root.battleSystem.clearBattle();
            game.moveChar([game.getTileInfo(19,29)]);
            if(battleResult)
            {
               game.battle9 = 2;
               game.itemContainer.gashoptank1._visible = false;
               root.playerStats.victory += ptsVictory;
               endFct3 = function()
               {
                  root.textWindow.closeWindow();
                  root.gotoAndStop("level14");
               };
               endFct2 = function()
               {
                  root.textWindow.closeWindow();
                  root.textWindow.drawWindow([root.getInsName("txtM13Z5_p1",root.parseKitMissions)],0,endFct3);
                  root.sfx.gotoAndPlay("winner");
               };
               root.textWindow.drawWindow([root.getInsName("txtM13Z5_p2",root.parseKitMissions)],39,endFct2);
            }
            else
            {
               game.battle9 = 0;
               game.registerWalkZone(game.grasshopBattle2);
               root.sfx.gotoAndPlay("music1");
            }
         };
      };
      fct = function()
      {
         game.battle9 = 1;
         game.unregisterWalkZone(this);
         root.textWindow.drawWindow([root.getInsName("txtM13Z5_p3",root.parseKitMissions)],39,endFct);
      };
      if(game.battle9 < 1)
      {
         game.registerWalkZone(this);
      }
   }
}
