onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      if(game.trigger5 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM14Z36_p1",root.parseKitMissions)],36,endFct);
      }
      else if(game.trigger6 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM14Z36_p2",root.parseKitMissions)],36,endFct);
      }
      else if(game.trigger8 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM14Z36_p3",root.parseKitMissions)],36,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
