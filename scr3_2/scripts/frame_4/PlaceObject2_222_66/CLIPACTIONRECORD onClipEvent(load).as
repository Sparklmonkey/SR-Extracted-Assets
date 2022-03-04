onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.doorKey = 1;
      game.addObject("doorKeyItem");
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.doorKey12._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.doorKey < 1)
   {
      game.registerWalkZone(this);
   }
}
