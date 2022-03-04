onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.doorKey = 1;
      game.registerWalkZone(game.womanZone);
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.doorKey5._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.addObject("doorKeyItem");
      game.unregisterWalkZone(this);
   };
   if(game.text1 > 0 && game.doorKey < 1)
   {
      game.registerWalkZone(this);
   }
}
