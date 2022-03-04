onClipEvent(load){
   _visible = false;
   if(root.crntEvent.id == 5)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         game.registerWalkZone(this);
      }
   }
   fct = function()
   {
      game.unregisterWalkZone(this);
      endFct = function()
      {
         root.textWindow.closeWindow();
      };
      if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev5_bkg7_1",root.parseKitWorld),root.getInsName("txt_ev5_bkg7_2",root.parseKitWorld),root.getInsName("txt_ev5_bkg7_3",root.parseKitWorld)],39,endFct);
      }
      else if(root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev5_bkg7_4",root.parseKitWorld),root.getInsName("txt_ev5_bkg7_5",root.parseKitWorld)],39,endFct);
      }
   };
}
