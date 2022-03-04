onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card1 = 1;
      game.addBattleCard(500);
      game.itemContainer.cardField3._visible = false;
      if(game.card2 < 1)
      {
         endFct = function()
         {
            root.cardInfoWindow.drawWindow(500);
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM2Z1_p1",root.parseKitMissions)],500,endFct);
      }
      else
      {
         root.cardInfoWindow.drawWindow(500);
      }
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card1 < 1)
   {
      game.registerWalkZone(this);
   }
}
