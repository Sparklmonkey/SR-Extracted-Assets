onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg7_1_1",root.parseKitMissions),root.getInsName("txt_cp2_bkg7_1_2",root.parseKitMissions),root.getInsName("txt_cp2_bkg7_1_3",root.parseKitMissions)],13,root.textWindow.closeWindow);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
