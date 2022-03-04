onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM12Z9_p1",root.parseKitMissions)],25,endFct);
      game.unregisterWalkZone(this);
   };
   if(game.trigger1 == 1 || game.trigger2 == 1 || game.trigger3 == 1)
   {
      game.registerWalkZone(this);
   }
}
