onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev10_bkg22_1",root.parseKitWorld),root.getInsName("txt_ev10_bkg22_2",root.parseKitWorld),root.getInsName("txt_ev10_bkg22_3",root.parseKitWorld)],56,root.textWindow.closeWindow);
      }
      else if(root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev10_bkg22_4",root.parseKitWorld),root.getInsName("txt_ev10_bkg22_5",root.parseKitWorld)],56,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 10)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         game.registerWalkZone(this);
      }
   }
}
