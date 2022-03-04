onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev3_bkg31_1",root.parseKitWorld),root.getInsName("txt_ev3_bkg31_2",root.parseKitWorld),root.getInsName("txt_ev3_bkg31_3",root.parseKitWorld)],27,root.textWindow.closeWindow);
      }
      else if(root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev3_bkg31_4",root.parseKitWorld)],27,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev3_bkg31_5",root.parseKitWorld)],27,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 3)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
