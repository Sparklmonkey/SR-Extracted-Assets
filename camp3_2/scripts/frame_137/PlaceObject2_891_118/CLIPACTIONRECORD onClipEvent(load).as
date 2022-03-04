onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 312;
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
            game.battle5 = 1;
            root.playerStats.victory += ptsVictory;
            game.itemContainer.shumdigger1._visible = false;
            endFct = function()
            {
               root.textWindow.closeWindow();
               game.itemContainer.KeyItem1._visible = false;
               game.registerWalkZone(game.cardZone);
               game.registerWalkZone(game.coronaZone);
               game.placeObject(0,15,22,"card",1);
               game.addObject("KeyItem");
               game.keyItem = 1;
               game.gameTrigger = 2;
            };
            root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg54_2_1",root.parseKitMissions)],13,endFct);
         }
         else
         {
            game.battle5 = 0;
            game.registerWalkZone(game.shumdiggerZone);
         }
         root.sfx.gotoAndPlay("music2");
         game.moveChar([game.getTileInfo(27,35)]);
      };
   };
   if(game.battle5 < 1)
   {
      game.registerWalkZone(this);
   }
}
