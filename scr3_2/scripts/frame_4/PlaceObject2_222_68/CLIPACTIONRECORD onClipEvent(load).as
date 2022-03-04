onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.board = 1;
      game.addObject("boardItem");
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.board13._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.board < 1)
   {
      game.registerWalkZone(this);
   }
}
