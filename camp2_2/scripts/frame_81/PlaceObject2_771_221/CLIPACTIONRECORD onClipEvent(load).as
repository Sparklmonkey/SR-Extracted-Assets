onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg18_1_1",root.parseKitMissions)],31,root.textWindow.closeWindow);
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger == 3)
   {
      game.registerWalkZone(this);
   }
}
