onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      delete endFct;
   };
   fct = function()
   {
      if(game.trigger1 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM12Z2_p1",root.parseKitMissions),root.getInsName("txtM12Z2_p2",root.parseKitMissions)],4,endFct);
      }
      if(game.trigger2 == 1 || game.trigger3 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM12Z2_p3",root.parseKitMissions),root.getInsName("txtM12Z2_p4",root.parseKitMissions)],4,endFct);
         game.trigger2 = 0;
         game.trigger3 = 1;
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
