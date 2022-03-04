onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg59_5_1",root.parseKitMissions)],56,root.textWindow.closeWindow);
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger == 5)
   {
      game.registerWalkZone(this);
   }
}
