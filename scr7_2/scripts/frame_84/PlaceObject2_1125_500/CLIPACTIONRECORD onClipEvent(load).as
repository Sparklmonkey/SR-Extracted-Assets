onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM7Z17_p1",root.parseKitMissions)],33,endFct);
      game.unregisterWalkZone(game.zoneGuard2);
   };
   game.registerWalkZone(this);
}
