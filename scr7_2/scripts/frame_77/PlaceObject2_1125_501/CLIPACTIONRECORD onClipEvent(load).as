onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      if(game.event7 != 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM7Z15_p1",root.parseKitMissions),root.getInsName("txtM7Z15_p2",root.parseKitMissions),root.getInsName("txtM7Z15_p3",root.parseKitMissions),root.getInsName("txtM7Z15_p4",root.parseKitMissions)],43,endFct);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txtM7Z15_p5",root.parseKitMissions)],43,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
