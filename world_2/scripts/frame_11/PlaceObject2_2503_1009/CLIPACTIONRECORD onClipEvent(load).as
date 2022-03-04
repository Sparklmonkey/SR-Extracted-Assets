onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      endFct = function()
      {
         root.textWindow.closeWindow();
      };
      root.textWindow.drawWindow([root.getInsName("txt_ev5_bkg8_2_1",root.parseKitWorld)],36,endFct);
   };
   if(root.crntEvent.id == 5)
   {
      if(root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
