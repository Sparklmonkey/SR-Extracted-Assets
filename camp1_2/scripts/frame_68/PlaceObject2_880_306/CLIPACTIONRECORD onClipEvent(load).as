onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.gameTrigger > 1)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg23_2_1",root.parseKitMissions)],22,root.textWindow.closeWindow);
      }
      else if(game.invGold > 1)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg23_2_2",root.parseKitMissions)],22,root.textWindow.closeWindow);
      }
      else if(game.text1 > 0)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg23_2_3",root.parseKitMissions)],22,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg23_2_4",root.parseKitMissions)],22,root.textWindow.closeWindow);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
