onClipEvent(load){
   _visible = false;
   if(game.trigger2 == 1)
   {
      fct = function()
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM11Z8_p1",root.parseKitMissions)],13,endFct);
         game.unregisterWalkZone(this);
      };
   }
   if(game.trigger3 == 1)
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         root.sfx.gotoAndPlay("battleSystem");
         ennemyStats = new Object();
         ennemyStats.type = 501;
         ennemyStats.spider = null;
         ennemyStats.card = ["101","104","203","203","206","301","500","500","500","504","507","508"];
         var _loc1_ = 2;
         root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
         game._visible = false;
         root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
         {
            game.moveChar([game.getTileInfo(20,26)]);
            game._visible = true;
            root.battleSystem.clearBattle();
            if(battleResult)
            {
               game.battleBoss = 1;
               root.playerStats.victory += ptsVictory;
               endFct2 = function()
               {
                  root.textWindow.closeWindow();
                  root.gotoAndStop("level12");
                  delete endFct2;
               };
               root.textWindow.drawWindow([root.getInsName("txtM11Z8_p2",root.parseKitMissions)],0,endFct2);
               root.sfx.gotoAndPlay("winner");
            }
            else
            {
               game.registerWalkZone(game.igneousBattle);
               game.battleBoss = 0;
               root.sfx.gotoAndPlay("music2");
            }
         };
      };
      fct = function()
      {
         root.textWindow.drawWindow([root.getInsName("txtM11Z8_p3",root.parseKitMissions),root.getInsName("txtM11Z8_p4",root.parseKitMissions),root.getInsName("txtM11Z8_p5",root.parseKitMissions)],13,endFct);
         game.unregisterWalkZone(this);
      };
   }
   game.registerWalkZone(this);
}
