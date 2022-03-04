onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct1 = function()
      {
         root.textWindow.closeWindow();
         game.unregisterDropZone(game.zoneInvectid1);
         game.unregisterWalkZone(game.zoneInvectid2);
         root.sfx.gotoAndPlay("battleSystem");
         ennemyStats = new Object();
         ennemyStats.type = 403;
         ennemyStats.spider = null;
         var _loc2_ = 2;
         root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc2_);
         game._visible = false;
         root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
         {
            game._visible = true;
            root.battleSystem.clearBattle();
            if(battleResult)
            {
               game.moveChar([game.getTileInfo(31,29)]);
               game.battleBoss = 1;
               game.spider = 2;
               game.itemContainer.soldier1._visible = false;
               game.itemContainer.soldier2._visible = false;
               game.itemContainer.commander3._visible = false;
               game.itemContainer.champion4._visible = false;
               root.playerStats.victory += ptsVictory;
               var _loc1_ = function()
               {
                  root.textWindow.closeWindow();
                  root.sfx.gotoAndPlay("winner");
                  root.gotoAndStop("level6");
               };
               root.textWindow.drawWindow([root.getInsName("txtM5Z8_p1",root.parseKitMissions)],10,_loc1_);
               game.unregisterDropZone(game.zoneInvectid2);
               game.removeObject("spiderItem");
            }
            else
            {
               if(game.char._y + game.offsetIsoY > game.zoneInvectid2._y)
               {
                  game.moveChar([game.getTileInfo(49,35)]);
               }
               else
               {
                  game.moveChar([game.getTileInfo(21,21)]);
               }
               game.battleBoss = 0;
            }
            root.sfx.gotoAndPlay("music2");
         };
      };
      root.textWindow.drawWindow([root.getInsName("txtM5Z8_p2",root.parseKitMissions),root.getInsName("txtM5Z8_p3",root.parseKitMissions)],10,endFct1);
   };
   if(root.sprAccess)
   {
      game.registerWalkZone(game.zoneInvectid2);
   }
}
