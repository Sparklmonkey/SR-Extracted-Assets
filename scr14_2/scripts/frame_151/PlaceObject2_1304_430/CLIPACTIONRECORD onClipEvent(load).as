onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.purpleFlower3 = 1;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.purpleFlower31._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.char.char.pickUpFct();
      game.addObject("purpleFlower3");
      game.unregisterWalkZone(this);
   };
   if(game.purpleFlower3 == 0)
   {
      game.registerWalkZone(this);
   }
}
