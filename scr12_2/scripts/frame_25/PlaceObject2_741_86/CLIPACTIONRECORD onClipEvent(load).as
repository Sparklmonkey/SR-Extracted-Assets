onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.battleCount != 12 && (game.trigger6 == 1 || game.trigger7 == 1))
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM12Z10_p1",root.parseKitMissions)],27,endFct);
      }
      if(game.battleCount == 12)
      {
         endFct2 = function()
         {
            root.textWindow.closeWindow();
            root.gotoAndStop("level13");
            delete endFct2;
         };
         endFct = function()
         {
            root.textWindow.closeWindow();
            root.textWindow.drawWindow([root.getInsName("txtM12Z10_p2",root.parseKitMissions)],0,endFct2);
            root.sfx.gotoAndPlay("winner");
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM12Z10_p3",root.parseKitMissions),root.getInsName("txtM12Z10_p4",root.parseKitMissions)],27,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
