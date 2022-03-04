onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.text15 == 0)
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM15Z9_p1",root.parseKitMissions)],19,endFct);
      }
      game.text15 = 1;
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
