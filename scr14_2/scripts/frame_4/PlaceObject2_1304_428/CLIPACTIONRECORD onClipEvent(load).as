onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.purpleFlower1 = 1;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.purpleFlower11._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.char.char.pickUpFct();
      game.addObject("purpleFlower1");
      game.unregisterWalkZone(this);
   };
   if(game.purpleFlower1 == 0)
   {
      game.registerWalkZone(this);
   }
}
