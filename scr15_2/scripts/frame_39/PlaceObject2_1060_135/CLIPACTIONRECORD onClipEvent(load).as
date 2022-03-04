onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.text8 == 0)
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM15Z12_p1",root.parseKitMissions)],23,endFct);
      }
      game.text8 = 1;
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
