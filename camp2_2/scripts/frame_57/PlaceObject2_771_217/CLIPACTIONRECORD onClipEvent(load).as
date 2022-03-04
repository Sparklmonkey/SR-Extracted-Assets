onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg15_1_1",root.parseKitMissions)],8,root.textWindow.closeWindow);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
