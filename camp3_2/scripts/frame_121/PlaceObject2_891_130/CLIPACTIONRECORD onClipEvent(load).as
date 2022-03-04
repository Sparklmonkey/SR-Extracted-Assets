onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         game.battleZone1.fct();
      };
      root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg52_1_1",root.parseKitMissions),root.getInsName("txt_cp3_bkg52_1_2",root.parseKitMissions)],59,endFct);
      game.unregisterWalkZone(this);
   };
   if(game.battle6 == 0)
   {
      game.registerWalkZone(this);
   }
}
