onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         game.unregisterWalkZone(game.infectid);
         game.battle12 = 1;
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
            if(game.char._x > game.infectid._x)
            {
               game.moveChar([game.getTileInfo(35,39)]);
            }
            else
            {
               game.moveChar([game.getTileInfo(35,51)]);
            }
            if(battleResult)
            {
               game.battle12 = 2;
               game.itemContainer.soldier4._visible = false;
               root.playerStats.victory += ptsVictory;
               delete fct;
            }
            else
            {
               game.battle12 = 0;
               game.registerWalkZone(game.infectid);
            }
            root.sfx.gotoAndPlay("music1");
         };
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM4Z5_p1",root.parseKitMissions)],6,endFct);
      game.unregisterWalkZone(game.infectid);
   };
   if(game.battle12 < 1)
   {
      game.registerWalkZone(this);
   }
}
