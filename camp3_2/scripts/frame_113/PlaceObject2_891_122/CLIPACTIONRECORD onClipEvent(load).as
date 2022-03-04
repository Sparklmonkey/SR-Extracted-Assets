onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg51_1_1",root.parseKitMissions)],13,root.textWindow.closeWindow);
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger < 5)
   {
      game.registerWalkZone(this);
   }
}
