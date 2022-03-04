onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.gameTrigger == 1 && game.text1 == 0)
      {
         game.text1 = 1;
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg18_3_1",root.parseKitMissions),root.getInsName("txt_cp2_bkg18_3_2",root.parseKitMissions)],56,root.textWindow.closeWindow);
      }
      else if(game.gameTrigger == 4)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg18_3_3",root.parseKitMissions),root.getInsName("txt_cp2_bkg18_3_4",root.parseKitMissions)],56,root.textWindow.closeWindow);
      }
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger == 1 || game.gameTrigger == 4)
   {
      game.registerWalkZone(this);
   }
}
