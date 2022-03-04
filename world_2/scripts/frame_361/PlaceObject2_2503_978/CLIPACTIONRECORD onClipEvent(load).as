onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      root.askWindow.drawWindow(new Array(root.getInsName("txtFight",root.parseKitWorld)),checkFct);
   };
   checkFct = function()
   {
      root.askWindow.closeWindow();
      if(obj.invectid || obj.id >= 600)
      {
         root.sfx.gotoAndPlay("battleInvectid");
      }
      else if(obj.id >= 500 && obj.id < 600)
      {
         root.sfx.gotoAndPlay("battleRider");
      }
      else
      {
         root.sfx.gotoAndPlay("battleMonster");
      }
      ennemyStats = new Object();
      ennemyStats.type = 406;
      var _loc2_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc2_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         if(battleResult)
         {
            var _loc1_ = 3;
            endFct = function()
            {
               root.textWindow.closeWindow();
            };
            game.humanHeadInv += _loc1_;
            game.addObject("objHuman");
            game.addObject("objHuman");
            game.addObject("objHuman");
            root.textWindow.drawWindow([root.getInsName("txt_ev_collect1",root.parseKitWorld) + _loc1_ + root.getInsName("txt_ev2_item",root.parseKitWorld) + root.getInsName("txt_ev_collect2",root.parseKitWorld)],0,root.textWindow.closeWindow);
            root.getRewardType(ptsVictory);
            root.playerStats.victory += ptsVictory;
         }
         else
         {
            game.registerWalkZone(zone);
         }
         root.sfx.gotoAndPlay(game.ContxtMusic);
      };
   };
   if(root.crntEvent.id == 2)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         game.registerWalkZone(this);
      }
   }
}
