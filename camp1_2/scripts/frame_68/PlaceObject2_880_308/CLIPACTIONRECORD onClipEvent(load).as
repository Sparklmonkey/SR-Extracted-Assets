onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.char.char.gotoAndStop("pickUp");
      game.itemContainer.bottle1._visible = false;
      game.addObject("bottle");
      game.invBottle = 1;
      game.unregisterWalkZone(this);
   };
   if(game.invBottle < 1 && game.invGold > 1)
   {
      game.registerWalkZone(this);
   }
}
