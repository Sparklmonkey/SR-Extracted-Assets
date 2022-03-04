onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card3 = 1;
      game.addBattleCard(301);
      root.cardInfoWindow.drawWindow(301);
      game.itemContainer.cardField3._visible = false;
      game.unregisterWalkZone(game.pickZone3);
      delete fct;
   };
   if(game.card3 < 3)
   {
      game.registerWalkZone(game.pickZone3);
   }
}
