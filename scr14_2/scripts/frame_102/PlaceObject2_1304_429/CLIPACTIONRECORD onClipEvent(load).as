onClipEvent(load){
   _visible = false;
   if(game.trigger5 == 1)
   {
      fct = function()
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM14Z24_p1",root.parseKitMissions)],27,endFct);
         game.unregisterWalkZone(this);
      };
      game.registerWalkZone(this);
   }
}
