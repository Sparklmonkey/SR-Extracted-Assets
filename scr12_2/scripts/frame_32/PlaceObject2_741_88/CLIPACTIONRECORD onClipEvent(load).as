onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      delete endFct;
   };
   fct = function()
   {
      if(game.trigger1 == 1 || game.trigger2 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM12Z15_p1",root.parseKitMissions)],23,endFct);
      }
      if(game.trigger3 == 1 || game.trigger4 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM12Z15_p2",root.parseKitMissions)],23,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
