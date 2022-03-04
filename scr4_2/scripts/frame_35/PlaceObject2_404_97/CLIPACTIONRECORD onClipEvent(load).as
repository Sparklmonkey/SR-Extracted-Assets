onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         game.battle7 = 1;
         game.unregisterWalkZone(this);
         root.sfx.gotoAndPlay("battleSystem");
         ennemyStats = new Object();
         ennemyStats.type = 400;
         ennemyStats.card = [];
         ennemyStats.dice = 9;
         ennemyStats.defense = 3;
         ennemyStats.action = 0;
         ennemyStats.life = 9;
         ennemyStats.victory = 27;
         ennemyStats.spider = null;
         var _loc1_ = 2;
         root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
         game._visible = false;
         root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
         {
            game._visible = true;
            root.battleSystem.clearBattle();
            game.moveChar([game.getTileInfo(41,29)]);
            if(battleResult)
            {
               game.battle7 = 2;
               game.itemContainer.soldier1._visible = false;
               game.unregisterWalkZone(game.infect1);
               root.playerStats.victory += ptsVictory;
               delete fct;
            }
            else
            {
               game.battle7 = 0;
               game.registerWalkZone(game.infect1);
            }
            root.sfx.gotoAndPlay("music1");
         };
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM4Z3_p1",root.parseKitMissions)],6,endFct);
   };
   if(game.battle7 < 1)
   {
      game.registerWalkZone(this);
   }
}
