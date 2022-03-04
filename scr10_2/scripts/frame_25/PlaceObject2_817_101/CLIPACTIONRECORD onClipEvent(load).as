onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      delete endFct;
   };
   fct = function()
   {
      if(game.seal < 2)
      {
         root.textWindow.drawWindow([root.getInsName("txtM10Z5_p1",root.parseKitMissions)],32,endFct);
      }
      if(game.trigger3 == 1 || game.trigger4 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM10Z5_p2",root.parseKitMissions)],33,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
