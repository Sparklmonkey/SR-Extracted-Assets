onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.KeyA = 1;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.Key11._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.char.char.pickUpFct();
      game.addObject("Key1");
      game.unregisterWalkZone(this);
   };
   if(game.KeyA < 1)
   {
      game.registerWalkZone(this);
   }
}
