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
            root.merchantWindow.drawWindow("craftsmith");
         };
         root.askWindow.drawWindow([root.getInsName("txt_merchant_bkg44_1",root.parseKitWorld)],endFct);
      }
      else
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
         };
         root.textWindow.drawWindow([root.getInsName("txt_merchant_bkg44_2",root.parseKitWorld)],0,endFct);
      }
   };
   game.registerWalkZone(this);
}
