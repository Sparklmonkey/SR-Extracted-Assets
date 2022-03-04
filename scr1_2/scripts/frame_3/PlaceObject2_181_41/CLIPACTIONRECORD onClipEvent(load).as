onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.text2 = 1;
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM1Z2_p1",root.parseKitMissions)],0,endFct);
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.text2 < 1)
   {
      game.registerWalkZone(this);
   }
}
