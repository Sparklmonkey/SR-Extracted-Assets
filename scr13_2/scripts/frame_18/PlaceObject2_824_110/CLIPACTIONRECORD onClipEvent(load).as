onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM13Z2_p1",root.parseKitMissions)],4,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
