onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM13Z6_p1",root.parseKitMissions)],26,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
