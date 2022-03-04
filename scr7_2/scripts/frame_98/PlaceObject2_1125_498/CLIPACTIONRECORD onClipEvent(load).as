onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM7Z20_p1",root.parseKitMissions)],55,endFct);
      game.unregisterWalkZone(this);
   };
   if(game.dropRing < 1)
   {
      game.registerWalkZone(this);
   }
}
