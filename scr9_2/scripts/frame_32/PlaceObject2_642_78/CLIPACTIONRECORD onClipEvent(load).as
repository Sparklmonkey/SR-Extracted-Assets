onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM9Z14_p1",root.parseKitMissions)],3,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
