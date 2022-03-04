onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.char.char.gotoAndStop("pickUp");
      game.itemContainer.gold1._visible = false;
      game.addObject("gold");
      game.invGold = 1;
      game.unregisterWalkZone(this);
   };
   if(game.invGold < 1 && game.text1 > 0)
   {
      game.registerWalkZone(this);
   }
}
