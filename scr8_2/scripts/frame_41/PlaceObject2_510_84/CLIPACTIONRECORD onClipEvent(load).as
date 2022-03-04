onClipEvent(load){
   _visible = false;
   if(game.trigger1 == 1)
   {
      fct = function()
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM8Z9_p1",root.parseKitMissions),root.getInsName("txtM8Z9_p2",root.parseKitMissions),root.getInsName("txtM8Z9_p3",root.parseKitMissions)],13,endFct);
         game.unregisterWalkZone(this);
         game.trigger1 = 0;
         game.trigger2 = 1;
      };
      game.registerWalkZone(this);
   }
}
