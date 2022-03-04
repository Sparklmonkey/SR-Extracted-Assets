onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg12_1_1",root.parseKitMissions)],18,root.textWindow.closeWindow);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
