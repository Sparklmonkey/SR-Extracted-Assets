onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg49_1_1",root.parseKitMissions),root.getInsName("txt_cp2_bkg49_1_2",root.parseKitMissions)],31,root.textWindow.closeWindow);
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger == 1)
   {
      game.registerWalkZone(this);
   }
}
