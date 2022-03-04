onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.text1 < 1)
      {
         game.text1 = 1;
         endFct = function()
         {
            root.textWindow.closeWindow();
            game.placeObject(0,13,14,"doorKey",5);
            game.registerWalkZone(game.keyZone);
            root.textWindow.drawWindow([root.getInsName("txtM4Z1_p1",root.parseKitMissions),root.getInsName("txtM4Z1_p2",root.parseKitMissions)],3,root.textWindow.closeWindow);
         };
         root.textWindow.drawWindow([root.getInsName("txtM4Z1_p3",root.parseKitMissions),root.getInsName("txtM4Z1_p4",root.parseKitMissions)],3,endFct);
         game.unregisterWalkZone(this);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txtM4Z1_p5",root.parseKitMissions)],3,root.textWindow.closeWindow);
         game.unregisterWalkZone(this);
      }
   };
   if(game.text1 < 2)
   {
      game.registerWalkZone(this);
   }
}
