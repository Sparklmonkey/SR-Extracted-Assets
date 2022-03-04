onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card2 = 1;
      game.addBattleCard(502);
      game.itemContainer.cardField2._visible = false;
      if(game.card1 < 1)
      {
         endFct = function()
         {
            root.cardInfoWindow.drawWindow(502);
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM2Z1_p1",root.parseKitMissions)],502,endFct);
      }
      else
      {
         root.cardInfoWindow.drawWindow(502);
      }
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card2 < 1)
   {
      game.registerWalkZone(this);
   }
}
