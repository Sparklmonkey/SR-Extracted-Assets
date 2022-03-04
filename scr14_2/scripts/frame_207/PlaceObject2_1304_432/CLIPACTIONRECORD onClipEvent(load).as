onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      if(game.trigger8 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM14Z34_p1",root.parseKitMissions)],31,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
