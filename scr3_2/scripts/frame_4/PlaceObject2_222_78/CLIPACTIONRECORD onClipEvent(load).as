onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.text1 = 1;
      root.textWindow.drawWindow([root.getInsName("txtM3Z1_p1",root.parseKitMissions)],1,root.textWindow.closeWindow);
      game.unregisterWalkZone(game.talkOracle);
   };
   if(game.text1 < 1)
   {
      game.registerWalkZone(this);
   }
}
