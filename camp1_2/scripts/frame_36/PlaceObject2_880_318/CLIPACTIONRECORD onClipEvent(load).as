onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         game.cardZone.fct();
      };
      root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg16_2_1",root.parseKitMissions)],56,endFct);
      game.unregisterWalkZone(this);
   };
}
