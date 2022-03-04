onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.balsam < 2)
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM5Z4_p1",root.parseKitMissions)],4,endFct);
      }
      else
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM5Z4_p2",root.parseKitMissions)],4,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
