onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM14Z10_p1",root.parseKitMissions)],5,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
