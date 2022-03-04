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
            root.merchantWindow.drawWindow("teacher");
         };
         root.askWindow.drawWindow([root.getInsName("txt_merchant_bkg50_1",root.parseKitWorld)],endFct);
      }
      else
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
         };
         root.textWindow.drawWindow([root.getInsName("txt_merchant_bkg50_2",root.parseKitWorld)],0,endFct);
      }
   };
   game.registerWalkZone(this);
}
