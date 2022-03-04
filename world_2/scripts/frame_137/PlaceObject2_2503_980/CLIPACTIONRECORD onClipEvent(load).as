onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      root.textWindow.drawWindow([root.getInsName("txt_ev5_bkg24_1",root.parseKitWorld),root.getInsName("txt_ev5_bkg24_2",root.parseKitWorld)],13,root.textWindow.closeWindow);
   };
   if(root.crntEvent.id == 5)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         game.registerWalkZone(this);
      }
   }
}
