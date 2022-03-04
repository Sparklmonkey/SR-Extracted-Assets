onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.invBook = 1;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.holyBook1._visible = false;
         game.animDoor.gotoAndPlay(2);
         delete game.char.char.pickUpFct;
      };
      game.char.char.pickUpFct();
      game.addObject("holyBook");
      game.openPath2();
      game.unregisterWalkZone(this);
   };
   if(game.invBook < 1)
   {
      game.registerWalkZone(this);
   }
}
