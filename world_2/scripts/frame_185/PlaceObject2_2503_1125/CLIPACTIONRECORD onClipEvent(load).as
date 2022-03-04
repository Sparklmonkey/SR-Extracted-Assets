onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      root.textWindow.drawWindow([root.getInsName("txt_ev4_bkg30_3_1",root.parseKitWorld)],13,root.textWindow.closeWindow);
   };
   if(root.crntEvent.id == 4 && root.crntEvent.state == "result")
   {
      game.registerWalkZone(this);
   }
}
