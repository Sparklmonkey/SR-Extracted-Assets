onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.KeyB = 1;
      game.action4 = 0;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.Key2._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.char.char.pickUpFct();
      game.addObject("KeyItem");
      game.unregisterWalkZone(this);
   };
   if(game.action4 == 1)
   {
      game.registerWalkZone(this);
   }
}
