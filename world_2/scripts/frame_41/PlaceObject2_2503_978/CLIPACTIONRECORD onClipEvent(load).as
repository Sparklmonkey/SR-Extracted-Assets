onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      endFct = function()
      {
         root.textWindow.closeWindow();
      };
      if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev1_bkg12_1",root.parseKitWorld),root.getInsName("txt_ev1_bkg12_2",root.parseKitWorld)],16,endFct);
      }
      else if(root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev1_bkg12_3",root.parseKitWorld),root.getInsName("txt_ev1_bkg12_4",root.parseKitWorld)],16,endFct);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev1_bkg12_5",root.parseKitWorld)],16,endFct);
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
