onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card5 = 1;
      game.addBattleCard(502);
      game.itemContainer.cardField2._visible = false;
      root.cardInfoWindow.drawWindow(502);
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card5 < 1)
   {
      game.registerWalkZone(this);
   }
}
