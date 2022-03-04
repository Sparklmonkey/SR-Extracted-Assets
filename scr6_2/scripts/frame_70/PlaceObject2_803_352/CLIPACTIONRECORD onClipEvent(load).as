onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card1 = 1;
      game.addBattleCard(508);
      game.itemContainer.cardField1._visible = false;
      root.cardInfoWindow.drawWindow(508);
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card1 < 1)
   {
      game.registerWalkZone(this);
   }
}
