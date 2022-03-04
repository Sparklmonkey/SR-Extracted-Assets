onClipEvent(load){
   _visible = false;
   checkFct = function()
   {
      root.askWindow.closeWindow();
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 602;
      ennemyStats.card = game.aquineDeck;
      var _loc1_ = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,_loc1_);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         if(battleResult)
         {
            game.invectidInv += 4;
            game.addObject("objInvectid");
            game.addObject("objInvectid");
            game.addObject("objInvectid");
            game.addObject("objInvectid");
            root.getRewardType(ptsVictory);
            root.playerStats.victory += ptsVictory;
         }
         else
         {
            game.registerWalkZone(zone);
         }
      };
      root.sfx.gotoAndPlay("music2");
   };
   fct2 = function()
   {
      root.askWindow.drawWindow(new Array(root.getInsName("txtFight",root.parseKitWorld)),checkFct);
   };
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(root.crntEvent.id == 8)
      {
         if(root.crntEvent.state == "collect")
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev8_bkg24_1",root.parseKitWorld)],31,fct2);
         }
         else if(root.crntEvent.state == "sprint")
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev8_bkg24_2",root.parseKitWorld)],31,fct2);
         }
      }
   };
   if(root.crntEvent.id == 8)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         game.registerWalkZone(this);
      }
   }
}
