onClipEvent(load){
   _visible = false;
   if(game.trigger5 == 1)
   {
      endFct2 = function()
      {
         root.textWindow.closeWindow();
         game.battle10 = 1;
         root.sfx.gotoAndPlay("battleSystem");
         ennemyStats = new Object();
         ennemyStats.type = 400;
         var _loc1_ = 2;
         root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
         game._visible = false;
         root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
         {
            game._visible = true;
            root.battleSystem.clearBattle();
            game.moveChar([game.getTileInfo(31,31)]);
            if(battleResult)
            {
               game.unregisterWalkZone(game.invectidBattle5);
               game.battleCount = game.battleCount + 1;
               game.itemContainer.soldier11._visible = false;
               game.battle10 = 2;
               root.playerStats.victory += ptsVictory;
               endFct4 = function()
               {
                  root.textWindow.closeWindow();
                  game.trigger5 = 0;
                  game.trigger6 = 1;
                  game.action4 = 1;
                  game.placeObject(0,20,19,"Key",1);
                  game.registerWalkZone(game.ringZone);
                  delete endFct4;
               };
               endFct3 = function()
               {
                  root.textWindow.closeWindow();
                  root.textWindow.drawWindow([root.getInsName("txtM12Z14_p1",root.parseKitMissions)],23,endFct4);
                  delete endFct3;
               };
               root.textWindow.drawWindow([root.getInsName("txtM12Z14_p2",root.parseKitMissions)],23,endFct3);
               delete endFct2;
            }
            else
            {
               game.battle10 = 0;
               game.registerWalkZone(game.invectidBattle5);
            }
            root.sfx.gotoAndPlay("music2");
         };
      };
      endFct = function()
      {
         root.textWindow.closeWindow();
         root.sfx.gotoAndPlay("battleSystem");
         ennemyStats = new Object();
         ennemyStats.type = 400;
         var _loc1_ = 2;
         root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
         game._visible = false;
         root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
         {
            game._visible = true;
            root.battleSystem.clearBattle();
            if(battleResult)
            {
               game.battle9 = 2;
               game.battleCount = game.battleCount + 1;
               game.unregisterWalkZone(this);
               game.itemContainer.soldier12._visible = false;
               root.playerStats.victory += ptsVictory;
               root.textWindow.drawWindow([root.getInsName("txtM12Z14_p3",root.parseKitMissions)],23,endFct2);
               if(game.battle10 < 1)
               {
                  game.registerWalkZone(game.invectidBattle5);
               }
               delete endFct;
            }
            else
            {
               game.battle9 = 0;
               game.registerWalkZone(game.invectidBattle5);
            }
            root.sfx.gotoAndPlay("music2");
         };
      };
      fct = function()
      {
         if(game.battle9 == 0)
         {
            game.battle9 = 1;
            root.textWindow.drawWindow([root.getInsName("txtM12Z14_p4",root.parseKitMissions)],23,endFct);
         }
         else
         {
            root.textWindow.drawWindow([root.getInsName("txtM12Z14_p3",root.parseKitMissions)],23,endFct2);
         }
         game.unregisterWalkZone(this);
      };
      if(game.battle9 < 1 || game.battle10 < 1)
      {
         game.registerWalkZone(this);
      }
   }
}
