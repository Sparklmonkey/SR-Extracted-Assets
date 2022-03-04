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
         root.textWindow.drawWindow([root.getInsName("txtM7Z3_p1",root.parseKitMissions)],41,endFct);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txtM7Z3_p2",root.parseKitMissions),root.getInsName("txtM7Z3_p3",root.parseKitMissions)],41,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
