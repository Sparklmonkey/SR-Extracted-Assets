onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.gameTrigger == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg47_1_1",root.parseKitMissions)],49,root.textWindow.closeWindow);
      }
      else if(game.gameTrigger == 2)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg47_1_2",root.parseKitMissions)],49,root.textWindow.closeWindow);
      }
      else if(game.gameTrigger == 3)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg47_1_3",root.parseKitMissions),root.getInsName("txt_cp2_bkg47_1_4",root.parseKitMissions)],49,root.textWindow.closeWindow);
      }
      else if(game.gameTrigger == 4)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg47_1_5",root.parseKitMissions)],49,root.textWindow.closeWindow);
      }
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger < 5)
   {
      game.registerWalkZone(this);
   }
}
