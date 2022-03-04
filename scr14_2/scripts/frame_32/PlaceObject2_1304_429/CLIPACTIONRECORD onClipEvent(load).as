onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      delete endFct;
   };
   fct = function()
   {
      if(game.trigger4 != 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM14Z4_p1",root.parseKitMissions)],18,endFct);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txtM14Z4_p2",root.parseKitMissions)],18,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
