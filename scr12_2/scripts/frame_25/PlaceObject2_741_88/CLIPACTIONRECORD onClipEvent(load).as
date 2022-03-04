onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      delete endFct;
   };
   fct = function()
   {
      if(game.trigger1 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM12Z11_p1",root.parseKitMissions)],24,endFct);
      }
      if(game.trigger2 == 1 || game.trigger3 == 1)
      {
         root.textWindow.drawWindow([root.getInsName("txtM12Z11_p2",root.parseKitMissions)],24,endFct);
         game.trigger2 = 0;
         game.trigger3 = 1;
      }
      if(game.trigger4 == 1 || game.trigger5 == 1 || game.trigger6 == 1 && game.battleCount != 12)
      {
         root.textWindow.drawWindow([root.getInsName("txtM12Z11_p3",root.parseKitMissions)],24,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
