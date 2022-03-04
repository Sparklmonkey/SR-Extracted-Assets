onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.gameTrigger == 4)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg59_1_1",root.parseKitMissions),root.getInsName("txt_cp2_bkg59_1_2",root.parseKitMissions),root.getInsName("txt_cp2_bkg59_1_3",root.parseKitMissions)],53,root.textWindow.closeWindow);
      }
      else if(game.gameTrigger == 5)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg59_1_4",root.parseKitMissions),root.getInsName("txt_cp2_bkg59_1_5",root.parseKitMissions),root.getInsName("txt_cp2_bkg59_1_6",root.parseKitMissions)],53,root.textWindow.closeWindow);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
