onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM10Z1_p1",root.parseKitMissions)],34,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
