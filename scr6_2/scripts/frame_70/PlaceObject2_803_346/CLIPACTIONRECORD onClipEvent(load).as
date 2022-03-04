onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM6Z7_p1",root.parseKitMissions),root.getInsName("txtM6Z7_p2",root.parseKitMissions)],17,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
