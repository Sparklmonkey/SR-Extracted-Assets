onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev11_bkg7_1",root.parseKitWorld),root.getInsName("txt_ev11_bkg7_2",root.parseKitWorld)],39,root.textWindow.closeWindow);
      }
      else if(root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev11_bkg7_3",root.parseKitWorld)],39,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev11_bkg7_4",root.parseKitWorld)],39,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 11)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
