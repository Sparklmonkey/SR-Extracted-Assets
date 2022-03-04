onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.action1 == 0)
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM14Z8_p1",root.parseKitMissions)],16,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
