onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(game.gameTrigger == 1 && game.text1 == 1)
      {
         endFct4 = function()
         {
            root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg48_1_1",root.parseKitMissions)],56,root.textWindow.closeWindow);
            game.gameTrigger = 2;
            delete endFct4;
         };
         endFct3 = function()
         {
            root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg48_1_2",root.parseKitMissions),root.getInsName("txt_cp2_bkg48_1_3",root.parseKitMissions),root.getInsName("txt_cp2_bkg48_1_4",root.parseKitMissions)],53,endFct4);
            delete endFct3;
         };
         endFct2 = function()
         {
            root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg48_1_5",root.parseKitMissions)],56,endFct3);
            delete endFct2;
         };
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg48_1_6",root.parseKitMissions),root.getInsName("txt_cp2_bkg48_1_7",root.parseKitMissions),root.getInsName("txt_cp2_bkg48_1_8",root.parseKitMissions)],53,endFct2);
      }
      else if(game.gameTrigger == 2)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg48_1_9",root.parseKitMissions)],53,root.textWindow.closeWindow);
      }
      else if(game.gameTrigger == 3)
      {
         endFct5 = function()
         {
            root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg48_1_10",root.parseKitMissions)],53,root.textWindow.closeWindow);
            game.gameTrigger = 4;
            delete endFct5;
         };
         endFct4 = function()
         {
            root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg48_1_11",root.parseKitMissions)],56,endFct5);
            delete endFct4;
         };
         endFct3 = function()
         {
            root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg48_1_12",root.parseKitMissions),root.getInsName("txt_cp2_bkg48_1_13",root.parseKitMissions)],53,endFct4);
            delete endFct3;
         };
         endFct2 = function()
         {
            root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg48_1_14",root.parseKitMissions)],56,endFct3);
            delete endFct2;
         };
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg48_1_15",root.parseKitMissions)],53,endFct2);
      }
      else if(game.gameTrigger == 4)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg48_1_16",root.parseKitMissions)],53,root.textWindow.closeWindow);
      }
   };
   if(game.gameTrigger < 5)
   {
      game.registerWalkZone(this);
   }
}
