onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.gold2 = 1;
      game.ring = 3;
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
   if(game.ring == 2)
   {
      game.registerWalkZone(this);
   }
}
