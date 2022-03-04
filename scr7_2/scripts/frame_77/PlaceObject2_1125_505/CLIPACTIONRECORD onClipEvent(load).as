onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.ring = 2;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.ring1._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.addObject("ringItem");
      game.unregisterWalkZone(game.ringZone);
   };
   if(game.ring == 1)
   {
      game.registerWalkZone(this);
   }
}
