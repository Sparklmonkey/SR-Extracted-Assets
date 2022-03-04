onClipEvent(enterFrame){
   _visible = false;
   fct = function()
   {
      game.gold1 = 1;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.gold1._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.char.char.pickUpFct();
      game.addObject("gold1");
      game.unregisterWalkZone(this);
   };
   if(game.gold1 < 1)
   {
      game.registerWalkZone(this);
   }
}
