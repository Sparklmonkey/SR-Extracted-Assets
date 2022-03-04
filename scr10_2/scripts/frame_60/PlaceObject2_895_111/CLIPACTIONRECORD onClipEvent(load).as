onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card1 = 1;
      game.addBattleCard(400);
      root.cardInfoWindow.drawWindow(400);
      if(game.action3 == 0)
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM10Z16_p1",root.parseKitMissions),root.getInsName("txtM10Z16_p2",root.parseKitMissions)],0,endFct);
         game.action3 = 1;
      }
      game.itemContainer.cardField2._visible = false;
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card1 < 1)
   {
      game.registerWalkZone(this);
   }
}
