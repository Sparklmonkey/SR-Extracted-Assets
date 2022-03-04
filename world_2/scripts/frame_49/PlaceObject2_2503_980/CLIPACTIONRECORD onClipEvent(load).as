onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev4_bkg13_1",root.parseKitWorld),root.getInsName("txt_ev4_bkg13_2",root.parseKitWorld)],24,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev4_bkg13_3",root.parseKitWorld),root.getInsName("txt_ev4_bkg13_4",root.parseKitWorld),root.getInsName("txt_ev4_bkg13_5",root.parseKitWorld)],24,root.textWindow.closeWindow);
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
