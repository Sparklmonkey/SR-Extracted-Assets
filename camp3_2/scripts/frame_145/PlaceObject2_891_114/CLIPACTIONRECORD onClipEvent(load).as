onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.battle8 == 0)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg58_5_1",root.parseKitMissions)],27,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg58_5_2",root.parseKitMissions)],27,root.textWindow.closeWindow);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
