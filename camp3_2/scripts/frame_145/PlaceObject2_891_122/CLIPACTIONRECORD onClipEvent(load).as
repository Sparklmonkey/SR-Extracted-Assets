onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 602;
      ennemyStats.card = new Array(103,104,104,105,106,201,201,204,300,507,508,505,503,503,506,507,508,509);
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
            root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg58_7_1",root.parseKitMissions),root.getInsName("txt_cp3_bkg58_7_2",root.parseKitMissions),root.getInsName("txt_cp3_bkg58_7_3",root.parseKitMissions)],38,game.battleZone2.fct);
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
