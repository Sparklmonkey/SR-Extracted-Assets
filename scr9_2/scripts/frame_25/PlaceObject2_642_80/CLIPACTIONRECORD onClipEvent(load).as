onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM9Z12_p1",root.parseKitMissions)],33,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
