onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         startbatlle;
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM7Z24_p1",root.parseKitMissions)],19,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
