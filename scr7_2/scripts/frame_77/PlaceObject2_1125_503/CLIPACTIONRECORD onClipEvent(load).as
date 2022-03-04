onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         game.placeObject(0,8,13,"ring",1);
         game.registerWalkZone(game.ringZone);
         game.ring = 1;
         delete endFct;
      };
      game.text33 = 1;
      root.textWindow.drawWindow([root.getInsName("txtM7Z12_p1",root.parseKitMissions)],14,endFct);
      game.unregisterWalkZone(this);
   };
   if(game.text33 < 1)
   {
      game.registerWalkZone(this);
   }
}
