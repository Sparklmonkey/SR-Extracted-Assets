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
         root.textWindow.drawWindow([root.getInsName("txtM11Z14_p1",root.parseKitMissions)],27,endFct);
         game.trigger2 = 0;
         game.trigger3 = 1;
         game.unregisterWalkZone(this);
      };
      game.registerWalkZone(this);
   }
}
