onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg8_1_1",root.parseKitMissions),root.getInsName("txt_cp3_bkg8_1_2",root.parseKitMissions),root.getInsName("txt_cp3_bkg8_1_3",root.parseKitMissions),root.getInsName("txt_cp3_bkg8_1_4",root.parseKitMissions),root.getInsName("txt_cp3_bkg8_1_5",root.parseKitMissions),root.getInsName("txt_cp3_bkg8_1_6",root.parseKitMissions)],27,root.textWindow.closeWindow);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
