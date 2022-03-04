onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.text17 == 0)
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM15Z17_p1",root.parseKitMissions)],4,endFct);
      }
      game.text17 = 1;
      game.unregisterWalkZone(this);
   };
   if(game.text17 < 1)
   {
      game.registerWalkZone(this);
   }
}
