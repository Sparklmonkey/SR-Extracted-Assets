onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM14Z2_p1",root.parseKitMissions),root.getInsName("txtM14Z2_p2",root.parseKitMissions)],16,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
