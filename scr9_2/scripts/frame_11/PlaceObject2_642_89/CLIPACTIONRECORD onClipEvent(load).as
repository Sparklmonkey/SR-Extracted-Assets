onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      delete endFct;
   };
   if(game.trigger1 == 1)
   {
      fct = function()
      {
         root.textWindow.drawWindow([root.getInsName("txtM9Z8_p1",root.parseKitMissions)],17,endFct);
         game.unregisterWalkZone(this);
      };
      game.registerWalkZone(this);
   }
   if(game.trigger2 == 1)
   {
      fct = function()
      {
         game.text11 = 1;
         root.textWindow.drawWindow([root.getInsName("txtM9Z8_p2",root.parseKitMissions),root.getInsName("txtM9Z8_p3",root.parseKitMissions),root.getInsName("txtM9Z8_p4",root.parseKitMissions)],17,endFct);
         game.placeObject(0,12,17,"Key",1);
         game.registerWalkZone(game.keyZone);
         game.unregisterWalkZone(this);
         game.action1 = 1;
         game.trigger2 = 0;
         game.trigger3 = 1;
      };
      if(game.text11 < 1)
      {
         game.registerWalkZone(this);
      }
   }
}
