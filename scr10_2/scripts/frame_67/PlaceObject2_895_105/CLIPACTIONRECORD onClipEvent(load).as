onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.battle1 = 3;
      game.card3 = 1;
      game.addBattleCard(303);
      root.cardInfoWindow.drawWindow(303);
      game.itemContainer.cardField1._visible = false;
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.battle1 == 2)
   {
      game.registerWalkZone(this);
   }
}
