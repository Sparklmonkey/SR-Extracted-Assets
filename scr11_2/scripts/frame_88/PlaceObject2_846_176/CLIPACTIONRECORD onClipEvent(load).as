onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.text18 == 0)
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM11Z23_p1",root.parseKitMissions)],19,endFct);
      }
      game.text18 = 1;
      game.unregisterWalkZone(this);
   };
   if(game.text18 < 1)
   {
      game.registerWalkZone(this);
   }
}
