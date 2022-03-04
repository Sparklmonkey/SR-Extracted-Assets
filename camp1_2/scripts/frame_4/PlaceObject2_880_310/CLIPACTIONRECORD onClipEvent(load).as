onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.invBottle < 1)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg12_2_1",root.parseKitMissions)],45,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg12_2_2",root.parseKitMissions)],45,root.textWindow.closeWindow);
      }
      game.unregisterWalkZone(this);
   };
   if(gameTrigger < 2)
   {
      game.registerWalkZone(this);
   }
}
