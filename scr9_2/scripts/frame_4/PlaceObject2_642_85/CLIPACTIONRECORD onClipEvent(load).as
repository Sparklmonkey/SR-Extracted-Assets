onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      delete endFct;
   };
   if(game.trigger1 == 1)
   {
      fct = function()
      {
         root.textWindow.drawWindow([root.getInsName("txtM9Z3_p1",root.parseKitMissions)],4,endFct);
         game.unregisterWalkZone(this);
      };
      game.registerWalkZone(this);
   }
   else
   {
      fct = function()
      {
         root.textWindow.drawWindow([root.getInsName("txtM9Z3_p2",root.parseKitMissions)],4,endFct);
         game.unregisterWalkZone(this);
      };
      game.registerWalkZone(this);
   }
}
