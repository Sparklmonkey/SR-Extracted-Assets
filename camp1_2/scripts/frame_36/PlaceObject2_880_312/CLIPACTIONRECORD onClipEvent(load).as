onClipEvent(load){
   _visible = false;
   endFct2 = function()
   {
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 614;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,2);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(33,21)]);
         if(battleResult)
         {
            root.playerStats.victory += ptsVictory;
            game.itemContainer.aquineMonster1._visible = false;
            game.itemContainer.aquine1._visible = false;
            game.placeObject(0,15,15,"magma",1);
            game.battle8 = 1;
            game.cathyZone.fct();
         }
         else
         {
            game.registerWalkZone(this);
         }
         root.sfx.gotoAndPlay("music2");
      };
   };
   endFct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg16_1_1",root.parseKitMissions),root.getInsName("txt_cp1_bkg16_1_2",root.parseKitMissions)],31,endFct2);
   };
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg16_1_3",root.parseKitMissions)],60,endFct);
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger > 3 && game.battle8 < 1)
   {
      game.registerWalkZone(this);
   }
}
