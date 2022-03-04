onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.char.char.gotoAndStop("pickUp");
      game.itemContainer.KeyItem1._visible = false;
      game.addObject("KeyItem");
      game.keyItem = 1;
      game.unregisterWalkZone(this);
   };
   if(game.keyItem < 1 && game.digHole == 1)
   {
      game.registerWalkZone(this);
   }
}
