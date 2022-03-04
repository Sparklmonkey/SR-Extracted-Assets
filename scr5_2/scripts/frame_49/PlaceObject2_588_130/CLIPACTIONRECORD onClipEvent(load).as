onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      if(game.balsam < 2)
      {
         root.textWindow.drawWindow([root.getInsName("txtM5Z10_p1",root.parseKitMissions)],7,endFct);
      }
      else
      {
         game.balsam = 3;
         root.textWindow.drawWindow([root.getInsName("txtM5Z10_p2",root.parseKitMissions)],7,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
