onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM15Z15_p1",root.parseKitMissions)],27,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
