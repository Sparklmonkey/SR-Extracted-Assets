onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      if(event7 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM7Z18_p1",root.parseKitMissions)],42,endFct);
      }
      else if(event6 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM7Z18_p2",root.parseKitMissions)],42,endFct);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txtM7Z18_p3",root.parseKitMissions)],42,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
