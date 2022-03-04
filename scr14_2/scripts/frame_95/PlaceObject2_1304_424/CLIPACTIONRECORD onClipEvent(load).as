onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.text3 = 1;
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM14Z23_p1",root.parseKitMissions),root.getInsName("txtM14Z23_p2",root.parseKitMissions),root.getInsName("txtM14Z23_p3",root.parseKitMissions)],23,endFct);
      game.placeObject(0,18,20,"neckless",1);
      game.unregisterWalkZone(this);
      game.registerWalkZone(game.neckZone);
   };
   if(game.text3 < 1)
   {
      game.registerWalkZone(this);
   }
}
