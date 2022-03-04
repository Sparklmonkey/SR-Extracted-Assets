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
            root.merchantWindow.drawWindow("merch2");
         };
         root.askWindow.drawWindow([root.getInsName("txt_merchant_bkg40_1",root.parseKitWorld)],endFct);
      }
      else
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
         };
         root.textWindow.drawWindow([root.getInsName("txt_merchant_bkg40_2",root.parseKitWorld)],0,endFct);
      }
   };
   game.registerWalkZone(this);
}
