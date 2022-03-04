onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         root.gotoAndStop("level3");
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM2Z3_p1",root.parseKitMissions)],0,endFct);
      root.sfx.gotoAndPlay("winner");
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.battle3 > 1)
   {
      game.setInstantBtn(0,13,4);
      game.setInstantBtn(0,14,4);
      game.registerWalkZone(game.zoneTransit);
   }
}
