onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev8_bkg30_1",root.parseKitWorld),root.getInsName("txt_ev8_bkg30_2",root.parseKitWorld),root.getInsName("txt_ev8_bkg30_3",root.parseKitWorld)],30,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev8_bkg30_4",root.parseKitWorld)],30,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 8)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
