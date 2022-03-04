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
         root.textWindow.drawWindow([root.getInsName("txt_ev5_bkg10_1",root.parseKitWorld)],36,endFct);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev5_bkg10_2",root.parseKitWorld)],36,endFct);
      }
   };
   if(root.crntEvent.id == 5)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         game.registerWalkZone(this);
      }
   }
}
