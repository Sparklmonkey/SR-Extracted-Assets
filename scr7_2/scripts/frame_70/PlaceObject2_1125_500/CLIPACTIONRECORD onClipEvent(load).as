onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      if(game.stone == 1)
      {
         if(game.web == 1)
         {
            root.textWindow.drawWindow([root.getInsName("txtM7Z9_p1",root.parseKitMissions)],18,endFct);
         }
         else
         {
            root.textWindow.drawWindow([root.getInsName("txtM7Z9_p2",root.parseKitMissions)],18,endFct);
         }
      }
      else if(game.boardDroped == 2)
      {
         root.textWindow.drawWindow([root.getInsName("txtM7Z9_p3",root.parseKitMissions),root.getInsName("txtM7Z9_p4",root.parseKitMissions)],18,endFct);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txtM7Z9_p5",root.parseKitMissions),root.getInsName("txtM7Z9_p6",root.parseKitMissions),root.getInsName("txtM7Z9_p7",root.parseKitMissions),root.getInsName("txtM7Z9_p8",root.parseKitMissions)],18,endFct);
      }
      game.unregisterWalkZone(this);
   };
   if(game.event7 < 1)
   {
      game.registerWalkZone(this);
   }
}
