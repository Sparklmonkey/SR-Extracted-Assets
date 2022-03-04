onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.invRemedy == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg13_2_5",root.parseKitMissions)],5,root.textWindow.closeWindow);
      }
      else if(game.invBottle == 2)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg13_2_4",root.parseKitMissions)],5,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg13_2_1",root.parseKitMissions),root.getInsName("txt_cp1_bkg13_2_2",root.parseKitMissions),root.getInsName("txt_cp1_bkg13_2_3",root.parseKitMissions)],5,root.textWindow.closeWindow);
      }
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger < 2)
   {
      game.registerWalkZone(this);
   }
}
