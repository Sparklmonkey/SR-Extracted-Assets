onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM10Z2_p1",root.parseKitMissions)],32,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
