onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         game.battleZone.fct();
      };
      root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg20_1_1",root.parseKitMissions),root.getInsName("txt_cp3_bkg20_1_2",root.parseKitMissions)],39,endFct);
      game.unregisterWalkZone(this);
   };
   if(game.battle1 == 0)
   {
      game.registerWalkZone(this);
   }
}
