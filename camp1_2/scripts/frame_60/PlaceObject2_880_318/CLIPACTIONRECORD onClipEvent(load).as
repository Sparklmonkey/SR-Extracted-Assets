onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg22_4_1",root.parseKitMissions)],56,root.textWindow.closeWindow);
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger > 3 && game.battle7 < 1)
   {
      game.registerWalkZone(this);
   }
}
