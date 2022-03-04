onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM7Z2_p1",root.parseKitMissions)],30,endFct);
      game.unregisterWalkZone(this);
   };
   if(game.event7 < 1)
   {
      game.registerWalkZone(this);
   }
}
