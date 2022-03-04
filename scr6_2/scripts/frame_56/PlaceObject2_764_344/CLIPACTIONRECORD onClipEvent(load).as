onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM6Z5_p1",root.parseKitMissions),root.getInsName("txtM6Z5_p2",root.parseKitMissions),root.getInsName("txtM6Z5_p3",root.parseKitMissions)],20,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
