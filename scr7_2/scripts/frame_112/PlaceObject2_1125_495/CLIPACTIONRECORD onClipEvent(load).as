onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         game.placeObject(0,13,17,"oil",1);
         game.registerWalkZone(game.oilZone);
         delete endFct;
      };
      game.text39 = 1;
      root.textWindow.drawWindow([root.getInsName("txtM7Z26_p1",root.parseKitMissions)],55,endFct);
      game.unregisterWalkZone(this);
   };
   if(game.text39 < 1)
   {
      game.registerWalkZone(this);
   }
}
