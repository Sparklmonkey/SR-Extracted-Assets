onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.gameTrigger == 2)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg52_2_1",root.parseKitMissions)],27,root.textWindow.closeWindow);
      }
      else if(game.gameTrigger == 3)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg52_2_2",root.parseKitMissions)],27,root.textWindow.closeWindow);
      }
      else if(game.gameTrigger == 4)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg52_2_3",root.parseKitMissions)],27,root.textWindow.closeWindow);
      }
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger < 5 && game.gameTrigger > 1)
   {
      game.registerWalkZone(this);
   }
}
