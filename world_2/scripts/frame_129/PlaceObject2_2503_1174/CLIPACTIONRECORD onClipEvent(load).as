onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(root.storesOpen)
      {
         endFct = function()
         {
            root.askWindow.closeWindow();
            root.merchantWindow.drawWindow("merch1");
         };
         root.askWindow.drawWindow([root.getInsName("txt_merchant_bkg23_1",root.parseKitWorld)],endFct);
      }
      else
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
         };
         root.textWindow.drawWindow([root.getInsName("txt_merchant_bkg23_2",root.parseKitWorld)],0,endFct);
      }
   };
   game.registerWalkZone(this);
}
