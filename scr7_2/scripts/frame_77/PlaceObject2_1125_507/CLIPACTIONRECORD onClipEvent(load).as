onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM7Z11_p1",root.parseKitMissions)],44,endFct);
      game.unregisterWalkZone(this);
   };
   if(game.event7 >= 1)
   {
      game.registerWalkZone(this);
   }
}
