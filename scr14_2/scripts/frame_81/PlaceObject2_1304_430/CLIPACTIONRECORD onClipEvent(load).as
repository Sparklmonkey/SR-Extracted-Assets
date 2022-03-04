onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM14Z15_p1",root.parseKitMissions)],29,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
