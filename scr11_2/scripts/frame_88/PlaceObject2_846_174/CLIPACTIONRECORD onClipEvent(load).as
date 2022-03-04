onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      delete endFct;
   };
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txtM11Z21_p1",root.parseKitMissions)],19,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
