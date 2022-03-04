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
         root.textWindow.drawWindow([root.getInsName("txtM7Z21_p1",root.parseKitMissions)],15,endFct);
      }
      else if(game.event8 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM7Z21_p2",root.parseKitMissions)],15,endFct);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txtM7Z21_p3",root.parseKitMissions)],15,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
