onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card3 = 1;
      game.addBattleCard(206);
      root.cardInfoWindow.drawWindow(206);
      game.itemContainer.cardField6._visible = false;
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card3 < 1)
   {
      game.registerWalkZone(this);
   }
}
