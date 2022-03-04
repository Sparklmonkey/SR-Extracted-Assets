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
         root.textWindow.drawWindow([root.getInsName("txtM8Z12_p1",root.parseKitMissions)],5,endFct);
      }
      if(game.trigger3 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM8Z12_p2",root.parseKitMissions)],5,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
