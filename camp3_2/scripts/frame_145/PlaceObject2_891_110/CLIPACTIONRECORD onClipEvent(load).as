onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.texteWindow.closeWindow();
         game.battleZone1.fct();
      };
      root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg58_1_1",root.parseKitMissions),root.getInsName("txt_cp3_bkg58_1_2",root.parseKitMissions),root.getInsName("txt_cp3_bkg58_1_3",root.parseKitMissions)],38,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
