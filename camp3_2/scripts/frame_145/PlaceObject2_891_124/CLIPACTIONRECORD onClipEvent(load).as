onClipEvent(load){
   _visible = false;
   fct = function()
   {
      ennemyStats = new Object();
      ennemyStats.type = 615;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         if(battleResult)
         {
            root.playerStats.victory += ptsVictory;
            game.battle8 = 1;
            game.placeObject(0,13,13,"card",1);
            game.placeObject(0,16,13,"card",2);
            game.registerWalkZone(game.cardZone1);
            game.registerWalkZone(game.cardZone2);
            game.registerWalkZone(game.coronaZone);
            game.registerWalkZone(game.magmaZone);
            game.registerWalkZone(game.igneousZone);
            game.itemContainer.aquine1._visible = false;
            game.itemContainer.buguese1._visible = false;
            game.itemContainer.scarab1._visible = false;
         }
         else
         {
            root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg58_7_4",root.parseKitMissions)],38,root.textWindow.closeWindow);
            game.registerWalkZone(game.bugueseZone);
            root.sfx.gotoAndPlay("music2");
         }
      };
   };
}
