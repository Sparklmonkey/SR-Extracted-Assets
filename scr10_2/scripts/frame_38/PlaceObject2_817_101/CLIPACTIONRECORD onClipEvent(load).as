onClipEvent(load){
   _visible = false;
   if(game.trigger2 == 1)
   {
      fct = function()
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM10Z10_p1",root.parseKitMissions),root.getInsName("txtM10Z10_p2",root.parseKitMissions)],25,endFct);
         game.unregisterWalkZone(this);
      };
      game.registerWalkZone(this);
   }
}
