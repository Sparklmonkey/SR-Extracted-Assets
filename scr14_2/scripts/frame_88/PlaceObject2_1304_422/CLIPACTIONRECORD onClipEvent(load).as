onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM14Z20_p1",root.parseKitMissions)],19,endFct);
      game.unregisterWalkZone(this);
   };
   if(game.neckless < 2)
   {
      game.registerWalkZone(this);
   }
}
