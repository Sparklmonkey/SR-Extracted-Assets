onClipEvent(load){
   _visible = false;
   if(game.trigger8 == 1)
   {
      fct = function()
      {
         endFct2 = function()
         {
            root.textWindow.closeWindow();
            root.gotoAndStop("level15");
            delete endFct2;
         };
         endFct = function()
         {
            root.textWindow.closeWindow();
            root.textWindow.drawWindow([root.getInsName("txtM14Z37_p1",root.parseKitMissions)],0,endFct2);
            root.sfx.gotoAndPlay("winner");
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM14Z37_p2",root.parseKitMissions),root.getInsName("txtM14Z37_p3",root.parseKitMissions),root.getInsName("txtM14Z37_p4",root.parseKitMissions)],27,endFct);
         game.unregisterWalkZone(this);
      };
      game.registerWalkZone(this);
   }
}
