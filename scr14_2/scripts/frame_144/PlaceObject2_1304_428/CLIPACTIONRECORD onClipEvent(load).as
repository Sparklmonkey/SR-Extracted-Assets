onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.purpleFlower2 = 1;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.purpleFlower21._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.char.char.pickUpFct();
      game.addObject("purpleFlower2");
      game.unregisterWalkZone(this);
   };
   if(game.purpleFlower2 == 0)
   {
      game.registerWalkZone(this);
   }
}
