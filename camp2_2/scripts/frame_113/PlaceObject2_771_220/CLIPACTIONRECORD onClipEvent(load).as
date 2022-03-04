onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card2 = 1;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.card2._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.char.char.pickUpFct();
      game.addBattleCard(416);
      root.cardInfoWindow.drawWindow(416);
      game.unregisterWalkZone(this);
   };
   if(game.card2 < 1)
   {
      game.registerWalkZone(this);
   }
}
