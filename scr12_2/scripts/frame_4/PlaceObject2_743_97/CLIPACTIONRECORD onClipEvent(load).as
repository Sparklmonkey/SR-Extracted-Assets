onClipEvent(load){
   _visible = false;
   if(game.trigger4 == 1)
   {
      endFct2 = function()
      {
         root.textWindow.closeWindow();
         game.battle2 = 1;
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
            game.moveChar([game.getTileInfo(29,27)]);
            if(battleResult)
            {
               game.battle2 = 2;
               game.battleCount = game.battleCount + 1;
               game.unregisterWalkZone(game.invectidBattle1);
               game.itemContainer.soldier22._visible = false;
               root.playerStats.victory += ptsVictory;
               game.trigger4 = 0;
               game.trigger5 = 1;
               endFct3 = function()
               {
                  root.textWindow.closeWindow();
                  delete endFct3;
               };
               root.textWindow.drawWindow([root.getInsName("txtM12Z1_p1",root.parseKitMissions)],4,endFct3);
               delete endFct2;
            }
            else
            {
               game.battle2 = 0;
               game.registerWalkZone(game.invectidBattle1);
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
            game.moveChar([game.getTileInfo(29,27)]);
            if(battleResult)
            {
               game.battle1 = 2;
               game.battleCount = game.battleCount + 1;
               game.unregisterWalkZone(game.invectidBattle1);
               game.itemContainer.soldier21._visible = false;
               root.playerStats.victory += ptsVictory;
               root.textWindow.drawWindow([root.getInsName("txtM12Z1_p2",root.parseKitMissions)],4,endFct2);
               if(game.battle2 < 1)
               {
                  game.registerWalkZone(game.invectidBattle1);
               }
               delete endFct;
            }
            else
            {
               game.battle1 = 0;
               game.registerWalkZone(game.invectidBattle1);
            }
            root.sfx.gotoAndPlay("music2");
         };
      };
      fct = function()
      {
         if(game.battle1 == 0)
         {
            game.battle1 = 1;
            root.textWindow.drawWindow([root.getInsName("txtM12Z1_p3",root.parseKitMissions)],4,endFct);
         }
         else
         {
            root.textWindow.drawWindow([root.getInsName("txtM12Z1_p4",root.parseKitMissions)],4,endFct2);
         }
         game.unregisterWalkZone(this);
      };
      if(game.battle1 < 1 || game.battle2 < 1)
      {
         game.registerWalkZone(this);
      }
   }
}
