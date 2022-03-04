onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg60_2_1",root.parseKitMissions),root.getInsName("txt_cp1_bkg60_2_2",root.parseKitMissions)],60,root.textWindow.closeWindow);
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger < 2)
   {
      game.registerWalkZone(this);
   }
}
