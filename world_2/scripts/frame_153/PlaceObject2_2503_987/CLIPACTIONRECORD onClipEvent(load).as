onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev6_bkg26_1",root.parseKitWorld)],45,root.textWindow.closeWindow);
      }
      else if(root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev6_bkg26_2",root.parseKitWorld),root.getInsName("txt_ev6_bkg26_3",root.parseKitWorld)],45,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev6_bkg26_4",root.parseKitWorld)],45,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 6)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
