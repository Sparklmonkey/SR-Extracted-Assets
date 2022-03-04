onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct2 = function()
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg46_2_1",root.parseKitMissions)],43,root.textWindow.closeWindow);
      };
      root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg46_2_2",root.parseKitMissions)],50,endFct2);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
