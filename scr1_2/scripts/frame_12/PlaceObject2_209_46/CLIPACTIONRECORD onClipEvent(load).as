onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         root.gotoAndStop("level2");
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM1Z3_p1",root.parseKitMissions)],0,endFct);
      root.sfx.gotoAndPlay("winner");
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.battle1 > 0)
   {
      game.openPath2();
      game.setInstantBtn(11,7,12);
      game.setInstantBtn(11,7,13);
      game.registerWalkZone(game.zoneTransit);
      stop();
   }
}
