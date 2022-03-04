onClipEvent(load){
   _visible = false;
   if(game.trigger1 == 1)
   {
      fct = function()
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM11Z17_p1",root.parseKitMissions)],35,endFct);
         game.unregisterWalkZone(this);
      };
      game.registerWalkZone(this);
   }
}
