onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      endFct = function()
      {
         root.textWindow.closeWindow();
      };
      root.textWindow.drawWindow([root.getInsName("txt_ev4_bkg42_closePath",root.parseKitWorld)],0,endFct);
   };
   if(root.crntEvent.id == 4)
   {
      game.registerWalkZone(this);
   }
}
