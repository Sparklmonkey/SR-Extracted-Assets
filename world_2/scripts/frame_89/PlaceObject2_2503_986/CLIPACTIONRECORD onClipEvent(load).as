onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev12_bkg18_1",root.parseKitWorld),root.getInsName("txt_ev12_bkg18_2",root.parseKitWorld)],49,root.textWindow.closeWindow);
      }
      else if(root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev12_bkg18_3",root.parseKitWorld),root.getInsName("txt_ev12_bkg18_4",root.parseKitWorld)],49,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev12_bkg18_5",root.parseKitWorld),root.getInsName("txt_ev12_bkg18_6",root.parseKitWorld)],49,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 12)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
