onClipEvent(load){
   _visible = false;
   if(game.trigger1 == 1 || game.trigger2 == 1 || game.trigger3 == 1 || game.trigger4 == 1)
   {
      fct = function()
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM14Z22_p1",root.parseKitMissions)],35,endFct);
         game.unregisterWalkZone(this);
      };
      game.registerWalkZone(this);
   }
}
