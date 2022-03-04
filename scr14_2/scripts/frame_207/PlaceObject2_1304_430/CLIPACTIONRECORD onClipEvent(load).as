onClipEvent(load){
   _visible = false;
   if(game.trigger7 == 1)
   {
      endFct4 = function()
      {
         root.textWindow.closeWindow();
         delete endFct4;
      };
      endFct3 = function()
      {
         game.battle2 = 1;
         game.unregisterWalkZone(this);
         root.textWindow.closeWindow();
         root.sfx.gotoAndPlay("battleSystem");
         ennemyStats = new Object();
         ennemyStats.type = 602;
         ennemyStats.card = ["103","201","203","503","503","506"];
         var _loc1_ = 2;
         root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
         game._visible = false;
         root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
         {
            game._visible = true;
            root.battleSystem.clearBattle();
            game.moveChar([game.getTileInfo(33,21)]);
            if(battleResult)
            {
               game.battle2 = 2;
               root.playerStats.victory += ptsVictory;
               game.trigger7 = 0;
               game.trigger8 = 1;
               game.itemContainer.aquine1._visible = false;
               game.placeObject(0,14,20,"aquine",2);
               game.placeObject(0,13,20,"buguese",1);
               game.registerWalkZone(game.coronaText);
               game.registerWalkZone(game.spiderText);
               game.registerWalkZone(game.aquineText);
               game.registerWalkZone(game.bugueseText);
               root.textWindow.drawWindow([root.getInsName("txtM14Z32_p1",root.parseKitMissions),root.getInsName("txtM14Z32_p2",root.parseKitMissions),root.getInsName("txtM14Z32_p3",root.parseKitMissions),root.getInsName("txtM14Z32_p4",root.parseKitMissions),root.getInsName("txtM14Z32_p5",root.parseKitMissions),root.getInsName("txtM14Z32_p6",root.parseKitMissions),root.getInsName("txtM14Z32_p7",root.parseKitMissions)],38,endFct4);
               delete endFct3;
            }
            else
            {
               game.battle2 = 0;
               game.registerWalkZone(game.aquineBattle);
            }
            root.sfx.gotoAndPlay("music2");
         };
      };
      endFct2 = function()
      {
         root.textWindow.closeWindow();
         root.textWindow.drawWindow([root.getInsName("txtM14Z32_p8",root.parseKitMissions)],31,endFct3);
      };
      endFct = function()
      {
         root.textWindow.closeWindow();
         root.textWindow.drawWindow([root.getInsName("txtM14Z32_p9",root.parseKitMissions)],13,endFct2);
      };
      fct = function()
      {
         root.textWindow.drawWindow([root.getInsName("txtM14Z32_p10",root.parseKitMissions)],31,endFct);
         game.unregisterWalkZone(this);
      };
      if(game.battle2 < 1)
      {
         game.registerWalkZone(this);
      }
   }
}
