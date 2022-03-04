onClipEvent(load){
   _visible = false;
   if(game.balsam == 0)
   {
      fct = function()
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM14Z29_p1",root.parseKitMissions),root.getInsName("txtM14Z29_p2",root.parseKitMissions),root.getInsName("txtM14Z29_p3",root.parseKitMissions)],36,endFct);
         game.unregisterWalkZone(this);
      };
      game.registerWalkZone(this);
   }
}
