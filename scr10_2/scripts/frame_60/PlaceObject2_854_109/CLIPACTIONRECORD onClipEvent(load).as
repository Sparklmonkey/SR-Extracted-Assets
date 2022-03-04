onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.Key = 1;
      game.action2 = 0;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.Key1._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.char.char.pickUpFct();
      game.addObject("KeyItem");
      game.unregisterWalkZone(this);
   };
   if(game.action2 == 1)
   {
      game.registerWalkZone(this);
   }
}
