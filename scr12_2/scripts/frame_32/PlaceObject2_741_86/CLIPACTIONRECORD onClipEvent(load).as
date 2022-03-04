onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      delete endFct;
   };
   fct = function()
   {
      if(game.trigger1 == 1 || game.trigger2 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM12Z12_p1",root.parseKitMissions)],13,endFct);
      }
      if(game.trigger3 == 1 || game.trigger4 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM12Z12_p2",root.parseKitMissions),root.getInsName("txtM12Z12_p3",root.parseKitMissions)],13,endFct);
         game.trigger3 = 0;
         game.trigger4 = 1;
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
