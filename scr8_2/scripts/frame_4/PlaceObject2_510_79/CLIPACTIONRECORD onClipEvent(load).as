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
         root.textWindow.drawWindow([root.getInsName("txtM8Z1_p1",root.parseKitMissions)],30,endFct);
         game.unregisterWalkZone(this);
      };
      game.registerWalkZone(this);
   }
   if(game.trigger2 == 1)
   {
      fct = function()
      {
         game.text11 = 1;
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM8Z1_p2",root.parseKitMissions),root.getInsName("txtM8Z1_p3",root.parseKitMissions),root.getInsName("txtM8Z1_p4",root.parseKitMissions),root.getInsName("txtM8Z1_p5",root.parseKitMissions)],30,endFct);
         game.placeObject(0,14,14,"purpleFlower",1);
         game.registerWalkZone(game.flowerZone);
         game.unregisterWalkZone(this);
         game.action1 = 1;
      };
      if(game.text11 < 1)
      {
         game.registerWalkZone(this);
      }
   }
}
