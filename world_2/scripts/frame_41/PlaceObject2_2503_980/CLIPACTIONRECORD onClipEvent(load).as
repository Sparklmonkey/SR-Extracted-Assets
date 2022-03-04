onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev2_bkg12_1",root.parseKitWorld)],5,root.textWindow.closeWindow);
      }
      else if(root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev2_bkg12_2",root.parseKitWorld)],5,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev2_bkg12_3",root.parseKitWorld)],5,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 2)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
