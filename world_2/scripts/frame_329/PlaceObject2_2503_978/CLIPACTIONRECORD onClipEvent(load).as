onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      root.textWindow.drawWindow([root.getInsName("txt_ev12_bkg48_1_1",root.parseKitWorld)],45,root.textWindow.closeWindow);
   };
   if(root.crntEvent.id == 12)
   {
      if(root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
