onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card2 = 1;
      game.addBattleCard(405);
      root.cardInfoWindow.drawWindow(405);
      game.itemContainer.cardField2._visible = false;
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card2 < 1)
   {
      game.registerWalkZone(this);
   }
}
