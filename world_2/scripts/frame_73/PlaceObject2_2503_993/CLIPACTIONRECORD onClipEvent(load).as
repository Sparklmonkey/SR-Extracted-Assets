onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev7_bkg16_1",root.parseKitWorld)],20,root.textWindow.closeWindow);
      }
      else if(root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev7_bkg16_2",root.parseKitWorld),root.getInsName("txt_ev7_bkg16_3",root.parseKitWorld)],20,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev7_bkg16_4",root.parseKitWorld)],20,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 7)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
