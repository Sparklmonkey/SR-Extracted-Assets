onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.text9 == 0)
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM15Z5_p1",root.parseKitMissions)],22,endFct);
      }
      game.text9 = 1;
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
