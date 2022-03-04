onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card2 = 1;
      game.addBattleCard(202);
      root.cardInfoWindow.drawWindow(202);
      game.itemContainer.cardField2._visible = false;
      game.unregisterWalkZone(game.pickZone2);
      delete fct;
   };
   if(game.card2 < 1)
   {
      game.registerWalkZone(game.pickZone2);
   }
}
