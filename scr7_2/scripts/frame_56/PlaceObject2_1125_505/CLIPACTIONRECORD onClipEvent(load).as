onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.pick1._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.addObject("pickItem");
      game.pick = 1;
      game.unregisterWalkZone(this);
   };
   if(game.text26 == 1 && game.pick < 1)
   {
      game.registerWalkZone(this);
   }
}
