onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM14Z3_p1",root.parseKitMissions)],14,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
