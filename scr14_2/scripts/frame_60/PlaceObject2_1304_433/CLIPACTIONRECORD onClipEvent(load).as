onClipEvent(load){
   _visible = false;
   if(game.trigger2 == 1)
   {
      fct = function()
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM14Z11_p1",root.parseKitMissions)],4,endFct);
         game.unregisterWalkZone(this);
      };
      game.registerWalkZone(this);
   }
}
