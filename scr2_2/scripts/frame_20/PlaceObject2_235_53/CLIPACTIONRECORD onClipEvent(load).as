onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle2 = 1;
      game.unregisterWalkZone(this);
      ennemyStats = new Object();
      ennemyStats.type = 300;
      ennemyStats.spider = null;
      var param = 2;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         game.moveChar([game.getTileInfo(45,39)]);
         if(battleResult)
         {
            game.battle2 = 2;
            game.itemContainer.bat23._visible = false;
            root.playerStats.victory += ptsVictory;
            delete fct;
         }
         else
         {
            game.battle2 = 0;
            game.registerWalkZone(game.zone3_1);
         }
         root.sfx.gotoAndPlay("music2");
      };
      var _loc1_ = new Array();
      endFct = function()
      {
         root.sfx.gotoAndPlay("battleSystem");
         root.battleSystem.initBattle(ennemyStats,root.playerStats,param);
         game._visible = false;
         root.textWindow.closeWindow();
         delete endFct;
      };
      if(game.text4 < 1)
      {
         _loc1_.push(root.getInsName("txtM2Z2_p1",root.parseKitMissions));
         _loc1_.push(root.getInsName("txtM2Z2_p2",root.parseKitMissions));
         _loc1_.push(root.getInsName("txtM2Z2_p3",root.parseKitMissions));
         root.textWindow.drawWindow(_loc1_,0,endFct);
      }
      else
      {
         root.sfx.gotoAndPlay("battleSystem");
         root.battleSystem.initBattle(ennemyStats,root.playerStats,param);
         game._visible = false;
      }
   };
   if(game.battle2 < 1)
   {
      game.registerWalkZone(this);
   }
}
