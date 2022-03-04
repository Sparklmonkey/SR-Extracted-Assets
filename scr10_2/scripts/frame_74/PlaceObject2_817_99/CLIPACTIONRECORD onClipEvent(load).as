onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.text16 = 1;
      root.textWindow.drawWindow([root.getInsName("txtM10Z20_p1",root.parseKitMissions)],40,txt2);
      game.unregisterWalkZone(this);
   };
   txt2 = function()
   {
      root.textWindow.closeWindow();
      root.textWindow.drawWindow([root.getInsName("txtM10Z20_p2",root.parseKitMissions)],30,txt3);
   };
   txt3 = function()
   {
      root.textWindow.closeWindow();
      root.textWindow.drawWindow([root.getInsName("txtM10Z20_p3",root.parseKitMissions)],40,endFct);
   };
   endFct = function()
   {
      root.textWindow.closeWindow();
      delete endFct;
   };
   if(game.text16 < 1)
   {
      game.registerWalkZone(this);
   }
}
