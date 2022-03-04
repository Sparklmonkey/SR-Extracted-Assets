onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         game.moveChar([game.getTileInfo(31,33)]);
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM7Z16_p1",root.parseKitMissions)],4,endFct);
      game.unregisterWalkZone(game.zoneGuard1);
   };
   game.registerWalkZone(this);
}
