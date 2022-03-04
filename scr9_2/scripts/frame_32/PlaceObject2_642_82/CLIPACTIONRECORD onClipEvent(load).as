onClipEvent(load){
   _visible = false;
   if(game.trigger3 == 1)
   {
      fct = function()
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM9Z16_p1",root.parseKitMissions)],13,endFct);
         game.unregisterWalkZone(this);
      };
      game.registerWalkZone(this);
   }
}
