onClipEvent(enterFrame){
   _visible = false;
   fct = function()
   {
      game.KeyB = 1;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.Key21._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.char.char.pickUpFct();
      game.addObject("Key2");
      game.unregisterWalkZone(this);
   };
   if(game.KeyB < 1)
   {
      game.registerWalkZone(this);
   }
}
