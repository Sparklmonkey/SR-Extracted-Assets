onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card4 = 1;
      game.addBattleCard(101);
      root.cardInfoWindow.drawWindow(101);
      game.itemContainer.cardField7._visible = false;
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card4 < 1)
   {
      game.registerWalkZone(this);
   }
}
