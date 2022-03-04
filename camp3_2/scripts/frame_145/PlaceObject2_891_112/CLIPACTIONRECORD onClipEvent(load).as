onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.battle8 == 0)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg58_4_1",root.parseKitMissions)],13,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg58_4_2",root.parseKitMissions)],13,root.textWindow.closeWindow);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
