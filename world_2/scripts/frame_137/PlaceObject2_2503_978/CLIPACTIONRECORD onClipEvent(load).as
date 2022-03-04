onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev1_bkg24_1",root.parseKitWorld),root.getInsName("txt_ev1_bkg24_2",root.parseKitWorld),root.getInsName("txt_ev1_bkg24_3",root.parseKitWorld),root.getInsName("txt_ev1_bkg24_4",root.parseKitWorld)],13,root.textWindow.closeWindow);
      }
      else if(root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev1_bkg24_5",root.parseKitWorld)],13,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 1)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         game.registerWalkZone(this);
      }
   }
}
