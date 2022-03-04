onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.gameTrigger < 2)
      {
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg60_1_1",root.parseKitMissions)],8,root.textWindow.closeWindow);
      }
      else
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            game.placeObject(0,14,13,"card",1);
            game.text3 = 1;
            game.registerWalkZone(game.cardZone);
         };
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg60_1_2",root.parseKitMissions)],8,endFct);
      }
      game.unregisterWalkZone(this);
   };
   if(game.text3 < 1)
   {
      game.registerWalkZone(this);
   }
}
