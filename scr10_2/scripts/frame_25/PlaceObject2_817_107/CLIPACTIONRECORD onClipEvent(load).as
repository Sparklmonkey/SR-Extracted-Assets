onClipEvent(load){
   _visible = false;
   if(game.trigger3 == 1)
   {
      fct = function()
      {
         game.text17 = 1;
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM10Z6_p1",root.parseKitMissions),root.getInsName("txtM10Z6_p2",root.parseKitMissions)],25,endFct);
         game.placeObject(2,17,22,"Key",2);
         game.trigger3 = 0;
         game.trigger4 = 1;
         game.action4 = 1;
         game.registerWalkZone(game.keyZone3);
         game.unregisterWalkZone(this);
      };
      if(game.text17 < 1)
      {
         game.registerWalkZone(this);
      }
   }
}
