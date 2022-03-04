onClipEvent(load){
   _visible = false;
   if(game.trigger1 == 1)
   {
      fct = function()
      {
         game.text2 = 1;
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM10Z7_p1",root.parseKitMissions),root.getInsName("txtM10Z7_p2",root.parseKitMissions),root.getInsName("txtM10Z7_p3",root.parseKitMissions)],13,endFct);
         game.unregisterWalkZone(this);
         game.registerWalkZone(game.keyZone1);
         game.action1 = 1;
         game.placeObject(0,13,10,"seal",4);
      };
      if(game.text2 < 1)
      {
         game.registerWalkZone(this);
      }
   }
}
