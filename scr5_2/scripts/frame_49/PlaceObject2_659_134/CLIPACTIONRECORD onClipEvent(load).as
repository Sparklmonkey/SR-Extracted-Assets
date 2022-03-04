onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.doorKey = 1;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.doorKey6._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.addObject("doorKeyItem");
      game.unregisterWalkZone(this);
   };
   if(game.balsam > 1 && game.doorKey < 1)
   {
      game.registerWalkZone(this);
   }
}
