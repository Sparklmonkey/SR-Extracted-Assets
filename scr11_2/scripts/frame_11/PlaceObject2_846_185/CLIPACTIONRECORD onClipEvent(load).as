onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM11Z4_p1",root.parseKitMissions)],22,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
