onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card1 = 1;
      game.addBattleCard(104);
      root.cardInfoWindow.drawWindow(104);
      game.itemContainer.cardField1._visible = false;
      game.unregisterWalkZone(game.pickZone1);
      delete fct;
   };
   if(game.card1 < 1)
   {
      game.registerWalkZone(game.pickZone1);
   }
}
