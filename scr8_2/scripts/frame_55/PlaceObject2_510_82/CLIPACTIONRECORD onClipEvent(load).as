onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      root.sfx.gotoAndPlay("winner");
      root.gotoAndStop("level9");
   };
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txtM8Z13_p1",root.parseKitMissions)],13,endFct);
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
