onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card1 = 1;
      game.addBattleCard(503);
      game.itemContainer.cardField4._visible = false;
      root.cardInfoWindow.drawWindow(503);
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card1 < 1)
   {
      game.registerWalkZone(this);
   }
}
