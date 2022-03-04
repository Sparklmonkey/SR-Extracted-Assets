onClipEvent(load){
   _visible = false;
   if(game.trigger4 == 1 || game.trigger5 == 1 || game.trigger6 == 1)
   {
      endFct2 = function()
      {
         root.textWindow.closeWindow();
         game.battle8 = 1;
         root.sfx.gotoAndPlay("battleSystem");
         ennemyStats = new Object();
         ennemyStats.type = 402;
         var _loc1_ = 2;
         root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
         game._visible = false;
         root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
         {
            game._visible = true;
            root.battleSystem.clearBattle();
            game.moveChar([game.getTileInfo(27,25)]);
            if(battleResult)
            {
               game.battleCount = game.battleCount + 1;
               game.action3 = 1;
               game.itemContainer.commander1._visible = false;
               root.playerStats.victory += ptsVictory;
            }
            else
            {
               game.battle8 = 0;
               game.registerWalkZone(game.invectidBattle4);
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
               game.battle7 = 2;
               game.battleCount = game.battleCount + 1;
               game.unregisterWalkZone(this);
               game.itemContainer.soldier11._visible = false;
               root.playerStats.victory += ptsVictory;
               root.textWindow.drawWindow([root.getInsName("txtM12Z8_p1",root.parseKitMissions)],25,endFct2);
               delete endFct;
            }
            else
            {
               game.battle7 = 0;
               game.registerWalkZone(game.invectidBattle4);
            }
            root.sfx.gotoAndPlay("music2");
         };
      };
      fct = function()
      {
         if(game.battle7 == 0)
         {
            game.battle7 = 1;
            root.textWindow.drawWindow([root.getInsName("txtM12Z8_p2",root.parseKitMissions)],25,endFct);
         }
         else
         {
            root.textWindow.drawWindow([root.getInsName("txtM12Z8_p3",root.parseKitMissions)],25,endFct2);
         }
         game.unregisterWalkZone(this);
      };
      if(game.battle7 < 1 || game.battle8 < 1)
      {
         game.registerWalkZone(this);
      }
   }
}
