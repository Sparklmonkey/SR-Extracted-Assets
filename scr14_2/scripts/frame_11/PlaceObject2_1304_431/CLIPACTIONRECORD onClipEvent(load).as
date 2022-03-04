onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      delete endFct;
   };
   fct = function()
   {
      if(game.trigger2 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM14Z1_p1",root.parseKitMissions)],48,endFct);
      }
      if(game.trigger3 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM14Z1_p2",root.parseKitMissions),root.getInsName("txtM14Z1_p3",root.parseKitMissions),root.getInsName("txtM14Z1_p4",root.parseKitMissions)],48,endFct);
         game.trigger3 = 0;
         game.trigger4 = 1;
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
