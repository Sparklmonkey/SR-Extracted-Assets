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
         root.textWindow.drawWindow([root.getInsName("txtM10Z17_p1",root.parseKitMissions)],24,endFct);
         game.unregisterWalkZone(this);
      };
      game.registerWalkZone(this);
   }
}
