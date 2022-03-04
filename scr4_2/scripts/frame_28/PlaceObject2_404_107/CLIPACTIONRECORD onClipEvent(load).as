onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card2 = 1;
      game.addBattleCard(100);
      root.cardInfoWindow.drawWindow(100);
      game.itemContainer.cardField1._visible = false;
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card2 < 1)
   {
      game.registerWalkZone(this);
   }
}
