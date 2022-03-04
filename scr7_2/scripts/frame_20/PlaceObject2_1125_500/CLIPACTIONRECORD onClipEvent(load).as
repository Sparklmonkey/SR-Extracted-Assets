onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      if(game.event7 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM7Z5_p1",root.parseKitMissions)],18,endFct);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txtM7Z5_p2",root.parseKitMissions)],18,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
