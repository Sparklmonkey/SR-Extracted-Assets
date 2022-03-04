onClipEvent(load){
   _visible = false;
   if(game.trigger4 == 1 || game.trigger5 == 1 || game.trigger6 == 1)
   {
      endFct3 = function()
      {
         root.textWindow.closeWindow();
         game.battle6 = 1;
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
            game.moveChar([game.getTileInfo(30,30)]);
            if(battleResult)
            {
               game.battleCount = game.battleCount + 1;
               game.battle6 = 2;
               game.action2 = 1;
               game.itemContainer.soldier22._visible = false;
               root.playerStats.victory += ptsVictory;
               delete endFct3;
            }
            else
            {
               game.battle6 = 0;
               game.registerWalkZone(game.invectidBattle3);
            }
            root.sfx.gotoAndPlay("music2");
         };
      };
      endFct2 = function()
      {
         root.textWindow.closeWindow();
         game.battle5 = 1;
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
               game.battleCount = game.battleCount + 1;
               game.battle5 = 2;
               game.itemContainer.soldier21._visible = false;
               root.playerStats.victory += ptsVictory;
               root.textWindow.drawWindow([root.getInsName("txtM12Z7_p3",root.parseKitMissions)],22,endFct3);
               if(game.battle6 < 1)
               {
                  game.registerWalkZone(this);
               }
               delete endFct2;
            }
            else
            {
               game.battle5 = 0;
               game.registerWalkZone(game.invectidBattle3);
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
               game.battle4 = 2;
               game.battleCount = game.battleCount + 1;
               game.unregisterWalkZone(this);
               game.itemContainer.soldier11._visible = false;
               root.playerStats.victory += ptsVictory;
               root.textWindow.drawWindow([root.getInsName("txtM12Z7_p1",root.parseKitMissions)],22,endFct2);
               if(game.battle5 < 1)
               {
                  game.registerWalkZone(this);
               }
               delete endFct;
            }
            else
            {
               game.battle4 = 0;
               game.registerWalkZone(game.invectidBattle3);
            }
            root.sfx.gotoAndPlay("music2");
         };
      };
      fct = function()
      {
         if(game.battle4 == 0)
         {
            game.battle4 = 1;
            root.textWindow.drawWindow([root.getInsName("txtM12Z7_p2",root.parseKitMissions)],22,endFct);
         }
         else if(game.battle4 == 2)
         {
            root.textWindow.drawWindow([root.getInsName("txtM12Z7_p1",root.parseKitMissions)],22,endFct2);
         }
         else if(game.battle5 == 2)
         {
            root.textWindow.drawWindow([root.getInsName("txtM12Z7_p3",root.parseKitMissions)],22,endFct3);
         }
         game.unregisterWalkZone(this);
      };
      if(game.battle4 < 1 || game.battle5 < 1 || game.battle6 < 1)
      {
         game.registerWalkZone(this);
      }
   }
}
