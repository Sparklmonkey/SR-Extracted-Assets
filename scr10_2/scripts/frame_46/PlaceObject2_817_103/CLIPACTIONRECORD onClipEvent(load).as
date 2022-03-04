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
         root.textWindow.drawWindow([root.getInsName("txtM10Z12_p1",root.parseKitMissions)],37,endFct);
         game.unregisterWalkZone(this);
      };
      game.registerWalkZone(this);
   }
}
