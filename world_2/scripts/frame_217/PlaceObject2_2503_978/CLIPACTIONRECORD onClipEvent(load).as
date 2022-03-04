onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev3_bkg34_1",root.parseKitWorld),root.getInsName("txt_ev3_bkg34_2",root.parseKitWorld)],26,root.textWindow.closeWindow);
      }
      else if(root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev3_bkg34_3",root.parseKitWorld)],26,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev3_bkg34_4",root.parseKitWorld),root.getInsName("txt_ev3_bkg34_5",root.parseKitWorld),root.getInsName("txt_ev3_bkg34_6",root.parseKitWorld)],26,root.textWindow.closeWindow);
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
