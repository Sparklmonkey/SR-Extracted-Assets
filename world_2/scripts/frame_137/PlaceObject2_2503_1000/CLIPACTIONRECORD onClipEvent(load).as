onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      root.textWindow.drawWindow([root.getInsName("txt_ev11_bkg24_2_1",root.parseKitWorld)],15,root.textWindow.closeWindow);
   };
   if(root.crntEvent.id == 11)
   {
      if(root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
