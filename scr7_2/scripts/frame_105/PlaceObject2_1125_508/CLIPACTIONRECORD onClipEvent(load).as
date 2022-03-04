onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      if(game.event8 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM7Z22_p1",root.parseKitMissions),root.getInsName("txtM7Z22_p2",root.parseKitMissions),root.getInsName("txtM7Z22_p5",root.parseKitMissions)],6,endFct);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txtM7Z22_p4",root.parseKitMissions)],6,endFct);
      }
      game.unregisterWalkZone(game.zoneInvectid2);
      game.unregisterWalkZone(game.zoneInvectid1);
   };
   game.registerWalkZone(this);
}
