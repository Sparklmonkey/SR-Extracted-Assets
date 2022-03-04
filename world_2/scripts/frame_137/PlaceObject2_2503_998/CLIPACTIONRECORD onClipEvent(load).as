onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      root.textWindow.drawWindow([root.getInsName("txt_ev11_bkg24_1_1",root.parseKitWorld),root.getInsName("txt_ev11_bkg24_1_2",root.parseKitWorld)],30,root.textWindow.closeWindow);
   };
   if(root.crntEvent.id == 11)
   {
      if(root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
