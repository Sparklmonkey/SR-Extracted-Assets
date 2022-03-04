onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.gameTrigger > 1)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg46_1_1",root.parseKitMissions)],55,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg46_1_2",root.parseKitMissions)],55,root.textWindow.closeWindow);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
