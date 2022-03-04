onClipEvent(load){
   _visible = false;
   endFct2 = function()
   {
      root.textWindow.closeWindow();
      game.battle12 = 1;
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 404;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(35,33)]);
         if(battleResult)
         {
            game.battleCount = game.battleCount + 1;
            game.action5 = 1;
            game.itemContainer.warrior1._visible = false;
            root.playerStats.victory += ptsVictory;
            delete endFct2;
         }
         else
         {
            game.battle12 = 0;
            game.registerWalkZone(game.invectidBattle6);
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
            game.battle11 = 2;
            game.battleCount = game.battleCount + 1;
            game.unregisterWalkZone(this);
            game.itemContainer.soldier11._visible = false;
            root.playerStats.victory += ptsVictory;
            root.textWindow.drawWindow([root.getInsName("txtM12Z1_p2",root.parseKitMissions)],19,endFct2);
            if(game.battle12 < 1)
            {
               game.registerWalkZone(this);
            }
            delete endFct;
         }
         else
         {
            game.battle11 = 0;
            game.registerWalkZone(game.invectidBattle6);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   fct = function()
   {
      if(game.battle11 == 0)
      {
         game.battle11 = 1;
         root.textWindow.drawWindow([root.getInsName("txtM12Z7_p2",root.parseKitMissions)],19,endFct);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txtM12Z8_p1",root.parseKitMissions)],19,endFct2);
      }
      game.unregisterWalkZone(this);
   };
   if(game.battle11 < 1 || game.battle12 < 1)
   {
      game.registerWalkZone(this);
   }
}
