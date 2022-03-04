onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.gameTrigger == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg54_1_1",root.parseKitMissions),root.getInsName("txt_cp3_bkg54_1_2",root.parseKitMissions),root.getInsName("txt_cp3_bkg54_1_3",root.parseKitMissions),root.getInsName("txt_cp3_bkg54_1_4",root.parseKitMissions),root.getInsName("txt_cp3_bkg54_1_5",root.parseKitMissions)],13,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg54_1_6",root.parseKitMissions)],13,root.textWindow.closeWindow);
      }
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger < 3)
   {
      game.registerWalkZone(this);
   }
}
