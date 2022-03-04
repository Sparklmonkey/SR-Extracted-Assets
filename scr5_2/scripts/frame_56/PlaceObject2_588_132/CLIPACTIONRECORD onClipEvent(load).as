onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.doorKey < 2)
      {
         root.textWindow.drawWindow([root.getInsName("txtM5Z12_p1",root.parseKitMissions)],8,root.textWindow.closeWindow);
      }
      game.unregisterWalkZone(this);
   };
   if(game.doorKey < 2)
   {
      game.registerWalkZone(this);
   }
}
