onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         game.magmaZone.fct();
      };
      root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg16_3_1",root.parseKitMissions),root.getInsName("txt_cp1_bkg16_3_2",root.parseKitMissions)],60,endFct);
      game.unregisterWalkZone(this);
   };
   if(game.battle8 > 0)
   {
      game.registerWalkZone(this);
   }
}
