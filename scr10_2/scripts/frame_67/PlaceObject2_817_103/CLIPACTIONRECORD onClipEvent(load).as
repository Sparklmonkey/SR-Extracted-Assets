onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM10Z19_p1",root.parseKitMissions),root.getInsName("txtM10Z19_p2",root.parseKitMissions),root.getInsName("txtM10Z19_p3",root.parseKitMissions)],13,endFct);
      game.unregisterWalkZone(this);
   };
   if(game.battle1 == 2)
   {
      game.registerWalkZone(this);
   }
}
