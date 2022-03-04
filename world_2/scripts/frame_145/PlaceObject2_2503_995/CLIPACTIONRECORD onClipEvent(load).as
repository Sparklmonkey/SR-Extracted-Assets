onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev10_bkg25_1_1",root.parseKitWorld)],27,root.textWindow.closeWindow);
      }
      else if(root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev10_bkg25_1_2",root.parseKitWorld)],27,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev10_bkg25_1_3",root.parseKitWorld)],27,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 10)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
