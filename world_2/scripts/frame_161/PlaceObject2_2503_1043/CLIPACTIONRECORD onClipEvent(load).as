onClipEvent(load){
   _visible = false;
   checkFct = function()
   {
      root.askWindow.closeWindow();
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 203;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         if(battleResult)
         {
            game.humanInv = game.humanInv + 1;
            game.addObject("objHuman");
            root.getRewardType(ptsVictory);
            root.playerStats.victory += ptsVictory;
            game.itemContainer.ballOfLight1._visible = false;
         }
         else
         {
            game.registerWalkZone(zone);
         }
      };
      root.sfx.gotoAndPlay("music2");
   };
   fct = function()
   {
      game.unregisterWalkZone(this);
      root.askWindow.drawWindow(new Array(root.getInsName("txtFight",root.parseKitWorld)),checkFct);
   };
   if(root.crntEvent.id == 11)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         game.registerWalkZone(this);
      }
   }
}
