onClipEvent(load){
   _visible = false;
   if(game.trigger1 == 1)
   {
      fct = function()
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM9Z4_p1",root.parseKitMissions),root.getInsName("txtM9Z4_p2",root.parseKitMissions),root.getInsName("txtM9Z4_p3",root.parseKitMissions),root.getInsName("txtM9Z4_p4",root.parseKitMissions),root.getInsName("txtM9Z4_p5",root.parseKitMissions),root.getInsName("txtM9Z4_p6",root.parseKitMissions)],13,endFct);
         game.unregisterWalkZone(this);
         game.trigger1 = 0;
         game.trigger2 = 1;
      };
      game.registerWalkZone(this);
   }
}
