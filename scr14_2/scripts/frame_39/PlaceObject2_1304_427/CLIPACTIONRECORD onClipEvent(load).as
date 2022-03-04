onClipEvent(load){
   _visible = false;
   if(game.trigger4 == 1)
   {
      fct = function()
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM14Z5_p1",root.parseKitMissions)],48,endFct);
         game.unregisterWalkZone(this);
      };
      game.registerWalkZone(this);
   }
}
