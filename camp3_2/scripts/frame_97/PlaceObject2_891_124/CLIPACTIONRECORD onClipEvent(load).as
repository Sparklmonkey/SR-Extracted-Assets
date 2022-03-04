onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.gameTrigger == 2)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg20_2_1",root.parseKitMissions)],26,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg20_2_2",root.parseKitMissions)],26,root.textWindow.closeWindow);
      }
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger > 1)
   {
      game.registerWalkZone(this);
   }
}
