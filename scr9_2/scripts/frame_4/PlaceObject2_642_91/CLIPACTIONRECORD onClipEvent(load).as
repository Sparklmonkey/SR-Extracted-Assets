onClipEvent(load){
   _visible = false;
   if(game.trigger1 != 1)
   {
      fct = function()
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM9Z2_p1",root.parseKitMissions)],4,endFct);
         game.unregisterWalkZone(this);
      };
      game.registerWalkZone(this);
   }
}
