onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct6 = function()
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg46_3_1",root.parseKitMissions)],60,root.textWindow.closeWindow);
         game.gameTrigger = 3;
      };
      endFct5 = function()
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg46_3_2",root.parseKitMissions)],56,endFct6);
      };
      endFct4 = function()
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg46_3_3",root.parseKitMissions),root.getInsName("txt_cp1_bkg46_3_4",root.parseKitMissions),root.getInsName("txt_cp1_bkg46_3_5",root.parseKitMissions)],60,endFct5);
      };
      endFct3 = function()
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg46_3_6",root.parseKitMissions)],56,endFct4);
      };
      endFct2 = function()
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg46_3_7",root.parseKitMissions)],60,endFct3);
      };
      root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg46_3_8",root.parseKitMissions)],56,endFct2);
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger > 1)
   {
      game.registerWalkZone(this);
   }
}
