onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      if(game.event4 == 1)
      {
         if(game.event6 < 2)
         {
            game.event6 = 1;
         }
         root.textWindow.drawWindow([root.getInsName("txtM7Z4_p1",root.parseKitMissions),root.getInsName("txtM7Z4_p2",root.parseKitMissions),root.getInsName("txtM7Z4_p3",root.parseKitMissions),root.getInsName("txtM7Z4_p4",root.parseKitMissions)],13,endFct);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txtM7Z4_p5",root.parseKitMissions),root.getInsName("txtM7Z4_p6",root.parseKitMissions),root.getInsName("txtM7Z4_p7",root.parseKitMissions)],13,endFct);
      }
      game.unregisterWalkZone(this);
   };
   if(game.event7 != 1 || game.event8 != 1)
   {
      game.registerWalkZone(this);
   }
}
