onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.purpleFlower = 1;
      game.action1 = 0;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.purpleFlower1._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.char.char.pickUpFct();
      game.addObject("purpleFlowerItem");
      game.unregisterWalkZone(this);
   };
   if(game.action1 == 1)
   {
      game.registerWalkZone(this);
   }
}
