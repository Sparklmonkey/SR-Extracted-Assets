onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card4 = 1;
      game.addBattleCard(408);
      root.cardInfoWindow.drawWindow(408);
      game.itemContainer.cardField1._visible = false;
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card4 < 1)
   {
      game.registerWalkZone(this);
   }
}
