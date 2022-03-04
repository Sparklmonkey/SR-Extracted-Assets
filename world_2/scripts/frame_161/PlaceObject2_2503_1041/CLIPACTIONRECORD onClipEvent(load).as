onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev9_bkg27_1",root.parseKitWorld)],20,root.textWindow.closeWindow);
      }
      else if(root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev9_bkg27_2",root.parseKitWorld)],20,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev9_bkg27_3",root.parseKitWorld)],20,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 9)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
