onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev4_bkg7_1",root.parseKitWorld),root.getInsName("txt_ev4_bkg7_2",root.parseKitWorld)],13,root.textWindow.closeWindow);
      }
      else if(root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev4_bkg7_3",root.parseKitWorld),root.getInsName("txt_ev4_bkg7_4",root.parseKitWorld),root.getInsName("txt_ev4_bkg7_5",root.parseKitWorld)],13,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 4)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         game.registerWalkZone(this);
      }
   }
}
