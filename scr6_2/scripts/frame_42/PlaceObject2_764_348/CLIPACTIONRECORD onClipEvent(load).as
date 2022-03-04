onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.text8 = 2;
      game.spiderItem = 1;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.spiderItem1._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.addObject("spiderItem");
      game.unregisterWalkZone(this);
   };
   if(game.text8 == 1)
   {
      game.registerWalkZone(this);
   }
}
