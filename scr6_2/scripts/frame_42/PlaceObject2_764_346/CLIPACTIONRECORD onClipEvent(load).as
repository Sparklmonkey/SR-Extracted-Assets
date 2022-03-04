onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.text8 = 1;
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM6Z4_p1",root.parseKitMissions)],9,endFct);
      game.placeObject(0,16,13,"spiderItem",1);
      game.registerWalkZone(game.zoneWebTake);
      game.unregisterWalkZone(this);
   };
   if(game.text8 < 1)
   {
      game.registerWalkZone(this);
   }
}
