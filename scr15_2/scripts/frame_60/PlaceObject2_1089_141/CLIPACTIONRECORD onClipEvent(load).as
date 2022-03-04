onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card5 = 1;
      game.addBattleCard(304);
      root.cardInfoWindow.drawWindow(304);
      game.itemContainer.cardField1._visible = false;
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card5 < 1)
   {
      game.registerWalkZone(this);
   }
}
