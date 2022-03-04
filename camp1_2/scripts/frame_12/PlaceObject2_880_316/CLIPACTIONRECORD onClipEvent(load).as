onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.char.char.gotoAndStop("pickUp");
      game.itemContainer.oileflask1._visible = false;
      game.addObject("oileflask");
      game.invRemedy = 1;
      game.unregisterWalkZone(this);
   };
   if(game.invRemedy < 1 && game.invBottle > 1)
   {
      game.registerWalkZone(this);
   }
}
