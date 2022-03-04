onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card3 = 1;
      game.addBattleCard(201);
      game.itemContainer.cardField3._visible = false;
      root.cardInfoWindow.drawWindow(201);
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card3 < 1)
   {
      game.registerWalkZone(this);
   }
}
