onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card1 = 1;
      game.addBattleCard(401);
      root.cardInfoWindow.drawWindow(401);
      game.itemContainer.cardField1._visible = false;
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card1 < 1)
   {
      game.registerWalkZone(this);
   }
}
