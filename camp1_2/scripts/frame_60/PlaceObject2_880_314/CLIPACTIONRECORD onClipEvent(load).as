onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg22_2_1",root.parseKitMissions),root.getInsName("txt_cp1_bkg22_2_2",root.parseKitMissions),root.getInsName("txt_cp1_bkg22_2_3",root.parseKitMissions)],5,root.textWindow.closeWindow);
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger > 1 && game.gameTrigger < 4)
   {
      game.registerWalkZone(this);
   }
}
