onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      root.textWindow.drawWindow([root.getInsName("txt_ev10_bkg25_3_1",root.parseKitWorld)],26,root.textWindow.closeWindow);
   };
   if(root.crntEvent.id == 10)
   {
      if(root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
