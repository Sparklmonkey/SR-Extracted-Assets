onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.ring = 1;
      game.gold1 = 3;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.ring1._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.char.char.pickUpFct();
      game.addObject("ring");
      game.unregisterWalkZone(this);
   };
   if(game.gold1 == 2)
   {
      game.registerWalkZone(this);
   }
}
