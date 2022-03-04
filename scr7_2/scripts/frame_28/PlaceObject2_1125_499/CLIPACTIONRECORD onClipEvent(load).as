onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.wood = 1;
      game.itemContainer.board1._visible = false;
      game.addObject("board");
      game.char.char.gotoAndStop("pickUp");
      game.unregisterWalkZone(this);
   };
   if(game.wood < 1)
   {
      game.registerWalkZone(this);
   }
}
