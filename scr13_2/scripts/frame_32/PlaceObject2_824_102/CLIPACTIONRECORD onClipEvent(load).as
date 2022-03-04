onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 203;
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
            game.battle5 = 2;
            game.unregisterWalkZone(this);
            root.playerStats.victory += ptsVictory;
            endFct2 = function()
            {
               root.textWindow.closeWindow();
               game.battle8 = 1;
               root.sfx.gotoAndPlay("battleSystem");
               ennemyStats = new Object();
               ennemyStats.type = 203;
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
                     game.action1 = 1;
                     root.playerStats.victory += ptsVictory;
                  }
                  else
                  {
                     game.battle8 = 0;
                     game.registerWalkZone(game.grasshopBattle);
                  }
                  root.sfx.gotoAndPlay("music2");
               };
            };
            root.textWindow.drawWindow([root.getInsName("txtM13Z4_p1",root.parseKitMissions)],39,endFct2);
            if(game.battle8 < 1)
            {
               game.registerWalkZone(this);
            }
         }
         else
         {
            game.battle5 = 0;
            game.registerWalkZone(game.grasshopBattle);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   fct = function()
   {
      game.battle5 = 1;
      game.unregisterWalkZone(this);
      root.textWindow.drawWindow([root.getInsName("txtM13Z4_p2",root.parseKitMissions)],39,endFct);
   };
   if(game.battle5 < 1)
   {
      game.registerWalkZone(this);
   }
}
