onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.gametrigger == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg18_1_1",root.parseKitMissions)],44,root.textWindow.closeWindow);
      }
      else if(game.gametrigger == 2)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg18_1_2",root.parseKitMissions)],44,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg18_1_3",root.parseKitMissions)],44,root.textWindow.closeWindow);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
