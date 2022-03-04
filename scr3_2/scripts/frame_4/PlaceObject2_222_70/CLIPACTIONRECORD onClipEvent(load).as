onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card6 = 1;
      game.addBattleCard(504);
      game.itemContainer.cardField3._visible = false;
      root.cardInfoWindow.drawWindow(504);
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card6 < 1)
   {
      game.registerWalkZone(this);
   }
}
