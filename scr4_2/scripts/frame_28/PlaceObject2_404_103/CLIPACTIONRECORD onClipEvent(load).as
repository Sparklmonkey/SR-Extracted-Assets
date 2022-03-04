onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         root.gotoAndStop("level5");
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM4Z6_p1",root.parseKitMissions)],0,endFct);
      game.unregisterWalkZone(this);
      root.sfx.gotoAndPlay("winner");
      delete fct;
   };
   game.registerWalkZone(this);
}
