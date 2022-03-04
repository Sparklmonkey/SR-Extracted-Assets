onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg22_1_1",root.parseKitMissions)],45,root.textWindow.closeWindow);
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger > 1 && game.gameTrigger < 4)
   {
      game.registerWalkZone(this);
   }
}
