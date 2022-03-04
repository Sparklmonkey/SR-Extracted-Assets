onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      if(game.event7 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM7Z10_p1",root.parseKitMissions)],5,endFct);
      }
      else if(game.stone == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM7Z10_p2",root.parseKitMissions)],5,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
