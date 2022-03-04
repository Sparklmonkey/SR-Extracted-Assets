onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card2 = 1;
      game.addBattleCard(506);
      root.cardInfoWindow.drawWindow(506);
      game.itemContainer.cardField5._visible = false;
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card2 < 1)
   {
      game.registerWalkZone(this);
   }
}
