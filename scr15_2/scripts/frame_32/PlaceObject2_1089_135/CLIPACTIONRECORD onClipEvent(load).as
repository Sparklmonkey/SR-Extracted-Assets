onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card6 = 2;
      game.addBattleCard(103);
      root.cardInfoWindow.drawWindow(103);
      game.itemContainer.cardField1._visible = false;
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card6 == 1)
   {
      game.registerWalkZone(this);
   }
}
