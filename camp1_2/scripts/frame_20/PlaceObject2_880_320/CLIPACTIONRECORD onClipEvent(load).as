onClipEvent(load){
   _visible = false;
   fct = function()
   {
      ennemyStats = new Object();
      ennemyStats.type = 402;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,2);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(33,21)]);
         if(battleResult)
         {
            game.battle3 = 1;
            root.playerStats.victory += ptsVictory;
            game.itemContainer.invectidCommander1._visible = false;
            game.placeObject(0,21,12,"cathy",1);
            root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg14_2_1",root.parseKitMissions),root.getInsName("txt_cp1_bkg14_2_2",root.parseKitMissions),root.getInsName("txt_cp1_bkg14_2_3",root.parseKitMissions),root.getInsName("txt_cp1_bkg14_2_4",root.parseKitMissions)],60,root.textWindow.closeWindow);
         }
         else
         {
            game.registerWalkZone(game.invectidZone);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
}
