onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      endFct5 = function()
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg18_2_1",root.parseKitMissions)],31,root.textWindow.closeWindow);
         game.gameTrigger = 3;
         delete endFct5;
      };
      endFct4 = function()
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg18_2_2",root.parseKitMissions)],56,endFct5);
         delete endFct4;
      };
      endFct3 = function()
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg18_2_3",root.parseKitMissions)],31,endFct4);
         delete endFct3;
      };
      endFct2 = function()
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg18_2_4",root.parseKitMissions)],56,endFct3);
         delete endFct2;
      };
      root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg18_2_5",root.parseKitMissions),root.getInsName("txt_cp2_bkg18_2_6",root.parseKitMissions),root.getInsName("txt_cp2_bkg18_2_7",root.parseKitMissions)],31,endFct2);
   };
   if(game.gameTrigger == 2)
   {
      game.registerWalkZone(this);
   }
}
