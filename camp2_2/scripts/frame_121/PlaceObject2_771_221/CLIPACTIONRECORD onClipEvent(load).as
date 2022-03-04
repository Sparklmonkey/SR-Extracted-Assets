onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.gameTrigger == 4)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg59_4_1",root.parseKitMissions),root.getInsName("txt_cp2_bkg59_4_2",root.parseKitMissions)],38,root.textWindow.closeWindow);
      }
      else if(game.gameTrigger == 5)
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            game.battleZone.fct();
         };
         root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg59_4_3",root.parseKitMissions),root.getInsName("txt_cp2_bkg59_4_4",root.parseKitMissions),root.getInsName("txt_cp2_bkg59_4_5",root.parseKitMissions)],38,endFct);
      }
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger == 4 || game.battle4 == 0)
   {
      game.registerWalkZone(this);
   }
}
