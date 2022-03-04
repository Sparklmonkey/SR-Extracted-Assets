onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.text26 = 1;
      endFct = function()
      {
         root.textWindow.closeWindow();
         game.placeObject(0,19,13,"pick",1);
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM7Z7_p1",root.parseKitMissions),root.getInsName("txtM7Z7_p2",root.parseKitMissions)],20,endFct);
      game.registerWalkZone(game.pickZone);
      game.unregisterWalkZone(this);
   };
   if(game.text26 < 1)
   {
      game.registerWalkZone(this);
   }
}
