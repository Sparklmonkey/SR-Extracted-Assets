onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card3 = 1;
      game.addBattleCard(203);
      root.cardInfoWindow.drawWindow(203);
      game.itemContainer.cardField1._visible = false;
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card3 < 1)
   {
      game.registerWalkZone(this);
   }
}
