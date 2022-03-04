onClipEvent(load){
   _visible = false;
   if(game.trigger4 == 1 || game.trigger5 == 1 || game.trigger6 == 1)
   {
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
            game.moveChar([game.getTileInfo(35,39)]);
            if(battleResult)
            {
               game.battleCount = game.battleCount + 1;
               game.battle3 = 2;
               game.action1 = 1;
               game.itemContainer.soldier11._visible = false;
               root.playerStats.victory += ptsVictory;
               delete endFct;
            }
            else
            {
               game.battle3 = 0;
               game.registerWalkZone(game.invectidBattle2);
            }
            root.sfx.gotoAndPlay("music2");
         };
      };
      fct = function()
      {
         game.battle3 = 1;
         game.unregisterWalkZone(this);
         root.textWindow.drawWindow([root.getInsName("txtM12Z4_p1",root.parseKitMissions)],16,endFct);
      };
      if(game.battle3 < 1)
      {
         game.registerWalkZone(this);
      }
   }
}
