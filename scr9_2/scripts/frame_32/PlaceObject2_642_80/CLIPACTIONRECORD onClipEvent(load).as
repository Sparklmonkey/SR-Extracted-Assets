onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM9Z17_p1",root.parseKitMissions)],23,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
