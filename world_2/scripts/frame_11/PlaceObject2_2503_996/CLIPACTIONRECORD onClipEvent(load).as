onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      endFct = function()
      {
         root.textWindow.closeWindow();
      };
      root.textWindow.drawWindow([root.getInsName("txt_ev1_bkg8_closePath",root.parseKitWorld)],0,endFct);
   };
   if(root.crntEvent.id == 1)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         game.registerWalkZone(this);
      }
   }
}
