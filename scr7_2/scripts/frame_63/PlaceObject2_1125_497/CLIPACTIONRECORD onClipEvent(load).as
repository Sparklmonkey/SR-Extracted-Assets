onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM7Z8_p1",root.parseKitMissions),root.getInsName("txtM7Z8_p2",root.parseKitMissions),root.getInsName("txtM7Z8_p3",root.parseKitMissions),root.getInsName("txtM7Z8_p4",root.parseKitMissions)],5,endFct);
      game.unregisterWalkZone(this);
   };
   if(game.stone != 1)
   {
      game.registerWalkZone(this);
   }
}
