onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      endFct = function()
      {
         root.textWindow.closeWindow();
      };
      root.textWindow.drawWindow([root.getInsName("txt_ev5_bkg8_1_1",root.parseKitWorld)],13,endFct);
   };
   if(root.crntEvent.id == 5)
   {
      if(root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
