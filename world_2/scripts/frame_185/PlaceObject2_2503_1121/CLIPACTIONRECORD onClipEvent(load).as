onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      root.textWindow.drawWindow([root.getInsName("txt_ev4_bkg30_4_1",root.parseKitWorld),root.getInsName("txt_ev4_bkg30_4_2",root.parseKitWorld)],26,root.textWindow.closeWindow);
   };
   if(root.crntEvent.id == 4 && root.crntEvent.state == "result")
   {
      game.registerWalkZone(this);
   }
}
