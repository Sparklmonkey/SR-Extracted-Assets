onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg11_1_1",root.parseKitMissions)],5,root.textWindow.closeWindow);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
