onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev12_bkg36_1",root.parseKitWorld),root.getInsName("txt_ev12_bkg36_2",root.parseKitWorld),root.getInsName("txt_ev12_bkg36_3",root.parseKitWorld)],56,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev12_bkg36_4",root.parseKitWorld),root.getInsName("txt_ev12_bkg36_5",root.parseKitWorld)],56,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 12)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         game.registerWalkZone(this);
      }
   }
}
