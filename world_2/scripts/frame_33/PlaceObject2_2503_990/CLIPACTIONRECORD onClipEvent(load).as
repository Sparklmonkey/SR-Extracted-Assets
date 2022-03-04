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
      root.sfx.gotoAndPlay("battleSystem");
      ennemyStats = new Object();
      ennemyStats.type = 401;
      var param = 2;
      root.battleSystem.initBattle(ennemyStats,root.playerStats,param);
      game._visible = false;
      root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
      {
         game._visible = true;
         root.battleSystem.clearBattle();
         if(battleResult)
         {
            no_piece = random(game.nbrPieces) + 1;
            tmpMachine = eval("game.machine" + no_piece + "Inv");
            tmpMachine++;
            set("game.machine" + no_piece + "Inv",tmpMachine);
            game.addObject("machine" + no_piece);
            delete tmpMachine;
            n0_piece = random(game.nbrPieces) + 1;
            tmpMachine = eval("game.machine" + n0_piece + "Inv");
            tmpMachine++;
            set("game.machine" + n0_piece + "Inv",tmpMachine);
            game.addObject("machine" + n0_piece);
            delete tmpMachine;
            root.getRewardType(ptsVictory);
            root.playerStats.victory += ptsVictory;
            root.textWindow.drawWindow([root.getInsName("txt_ev_collect1",root.parseKitWorld) + "2" + root.getInsName("txt_ev5_item",root.parseKitWorld) + root.getInsName("txt_ev_collect2",root.parseKitWorld)],0,root.textWindow.closeWindow);
         }
         else
         {
            game.registerWalkZone(zone);
         }
      };
      root.sfx.gotoAndPlay("music2");
   };
   if(root.crntEvent.id == 5)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         game.registerWalkZone(this);
      }
   }
}
