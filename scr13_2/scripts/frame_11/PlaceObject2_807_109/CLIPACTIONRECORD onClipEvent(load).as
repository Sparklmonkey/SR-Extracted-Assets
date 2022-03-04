onClipEvent(load){
   _visible = false;
   fct = function()
   {
      var _loc1_ = this;
      game.battle6 = 1;
      game.unregisterWalkZone(_loc1_);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 400;
      var _loc2_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc2_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         if(battleResult)
         {
            game.battle6 = 2;
            game.unregisterWalkZone(this);
            game.itemContainer.soldier11._visible = false;
            root.playerStats.victory += ptsVictory;
            endFct2 = function()
            {
               root.textWindow.closeWindow();
               game.battle7 = 1;
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
                  game.moveChar([game.getTileInfo(27,25)]);
                  if(battleResult)
                  {
                     game.battleCount = game.battleCount + 1;
                     game.itemContainer.soldier12._visible = false;
                     root.playerStats.victory += ptsVictory;
                     delete endFct2;
                  }
                  else
                  {
                     game.battle7 = 0;
                     game.registerWalkZone(game.invectidBattle1);
                  }
                  root.sfx.gotoAndPlay("music2");
               };
            };
            root.textWindow.drawWindow([root.getInsName("txtM12Z1_p2",root.parseKitMissions)],27,endFct2);
            if(game.battle7 < 1)
            {
               game.registerWalkZone(this);
            }
            delete fct;
         }
         else
         {
            game.battle6 = 0;
            game.registerWalkZone(game.invectidBattle1);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   if(game.battle6 < 1)
   {
      game.registerWalkZone(this);
   }
}
