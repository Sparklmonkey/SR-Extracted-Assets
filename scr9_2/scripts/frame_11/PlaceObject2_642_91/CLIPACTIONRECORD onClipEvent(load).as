onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM9Z7_p1",root.parseKitMissions)],19,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
