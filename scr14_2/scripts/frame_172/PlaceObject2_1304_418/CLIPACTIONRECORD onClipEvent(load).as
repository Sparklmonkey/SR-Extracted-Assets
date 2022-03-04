onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.text13 = 1;
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM14Z27_p1",root.parseKitMissions),root.getInsName("txtM14Z27_p2",root.parseKitMissions),root.getInsName("txtM14Z27_p3",root.parseKitMissions),root.getInsName("txtM14Z27_p4",root.parseKitMissions)],26,endFct);
      game.trigger1 = 0;
      game.trigger2 = 1;
      game.unregisterWalkZone(this);
   };
   if(game.trigger1 == 1)
   {
      game.registerWalkZone(this);
   }
}
