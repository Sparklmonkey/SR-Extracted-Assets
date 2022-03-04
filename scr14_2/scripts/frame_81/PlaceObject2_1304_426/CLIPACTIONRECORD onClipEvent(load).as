onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.trigger1 == 1)
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM14Z17_p1",root.parseKitMissions)],25,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
