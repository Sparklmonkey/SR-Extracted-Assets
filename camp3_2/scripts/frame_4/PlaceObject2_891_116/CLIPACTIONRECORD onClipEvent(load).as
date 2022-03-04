onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg7_1_1",root.parseKitMissions)],26,root.textWindow.closeWindow);
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger == 1)
   {
      game.registerWalkZone(this);
   }
}
