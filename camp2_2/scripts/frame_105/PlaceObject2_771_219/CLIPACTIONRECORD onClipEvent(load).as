onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.gameTrigger == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg49_3_1",root.parseKitMissions)],45,root.textWindow.closeWindow);
      }
      if(game.gameTrigger == 2)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg49_3_2",root.parseKitMissions)],45,root.textWindow.closeWindow);
      }
      if(game.gameTrigger == 3)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg49_3_3",root.parseKitMissions)],45,root.textWindow.closeWindow);
      }
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger < 4)
   {
      game.registerWalkZone(this);
   }
}
