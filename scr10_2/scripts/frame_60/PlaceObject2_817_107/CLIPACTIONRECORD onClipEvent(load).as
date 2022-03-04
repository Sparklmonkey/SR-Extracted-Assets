onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.text9 = 1;
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM10Z18_p1",root.parseKitMissions),root.getInsName("txtM10Z18_p2",root.parseKitMissions),root.getInsName("txtM10Z18_p3",root.parseKitMissions)],13,endFct);
      game.action2 = 1;
      game.placeObject(0,16,23,"Key",1);
      game.registerWalkZone(game.keyZone2);
      game.unregisterWalkZone(this);
   };
   if(game.text9 < 1)
   {
      game.registerWalkZone(this);
   }
}
