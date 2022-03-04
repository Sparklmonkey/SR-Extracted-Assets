onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.rope = 1;
      game.addObject("rope");
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.rope1._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.rope < 1)
   {
      game.registerWalkZone(this);
   }
}
