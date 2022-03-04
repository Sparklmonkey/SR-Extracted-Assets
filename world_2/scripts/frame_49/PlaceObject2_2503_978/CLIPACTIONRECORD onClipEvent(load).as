onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(root.crntEvent.state == "result")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev1_bkg13_1",root.parseKitWorld),root.getInsName("txt_ev1_bkg13_2",root.parseKitWorld)],14,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev1_bkg13_3",root.parseKitWorld)],14,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 1)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
