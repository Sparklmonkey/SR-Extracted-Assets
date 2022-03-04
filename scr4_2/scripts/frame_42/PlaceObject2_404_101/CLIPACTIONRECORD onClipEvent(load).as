onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card4 = 1;
      game.addBattleCard(506);
      game.itemContainer.cardField6._visible = false;
      root.cardInfoWindow.drawWindow(506);
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card4 < 1)
   {
      game.registerWalkZone(this);
   }
}
