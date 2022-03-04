onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card1 = 1;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.card1._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.char.char.pickUpFct();
      game.addBattleCard(208);
      root.cardInfoWindow.drawWindow(208);
      game.unregisterWalkZone(this);
   };
   if(game.card1 < 1)
   {
      game.registerWalkZone(this);
   }
}
