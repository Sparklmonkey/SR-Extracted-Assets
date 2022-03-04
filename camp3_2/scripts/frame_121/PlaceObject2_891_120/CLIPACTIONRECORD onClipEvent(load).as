onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.gameTrigger == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg52_3_1",root.parseKitMissions),root.getInsName("txt_cp3_bkg52_3_2",root.parseKitMissions),root.getInsName("txt_cp3_bkg52_3_3",root.parseKitMissions)],56,root.textWindow.closeWindow);
      }
      else if(game.gameTrigger == 2)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg52_3_4",root.parseKitMissions),root.getInsName("txt_cp3_bkg52_3_5",root.parseKitMissions)],56,root.textWindow.closeWindow);
      }
      else if(game.gameTrigger == 3)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg52_3_6",root.parseKitMissions)],56,root.textWindow.closeWindow);
      }
      else if(game.gameTrigger == 4)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg52_3_7",root.parseKitMissions)],56,root.textWindow.closeWindow);
      }
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger < 5)
   {
      game.registerWalkZone(this);
   }
}
