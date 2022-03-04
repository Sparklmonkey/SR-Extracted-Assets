onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM8Z7_p1",root.parseKitMissions),root.getInsName("txtM8Z7_p2",root.parseKitMissions),root.getInsName("txtM8Z7_p3",root.parseKitMissions)],36,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
