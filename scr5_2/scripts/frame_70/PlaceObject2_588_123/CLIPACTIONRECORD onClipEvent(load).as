onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.purpleFlower = 1;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.purpleFlower1._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.addObject("purpleFlower");
      game.unregisterWalkZone(this);
   };
   if(game.purpleFlower < 1)
   {
      game.registerWalkZone(this);
   }
}
