onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.axe = 1;
      game.addObject("axeItem");
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.axe5._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.unregisterWalkZone(this);
   };
   if(game.doorKey > 1 && game.axe < 1)
   {
      game.registerWalkZone(this);
   }
}
