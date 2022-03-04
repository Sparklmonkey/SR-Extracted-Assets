onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.purpleFlower4 = 1;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.purpleFlower41._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.char.char.pickUpFct();
      game.addObject("purpleFlower4");
      game.unregisterWalkZone(this);
   };
   if(game.purpleFlower4 == 0)
   {
      game.registerWalkZone(this);
   }
}
