onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.oilTook = 1;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.oil1._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.addObject("oilItem");
      game.unregisterWalkZone(this);
   };
   if(game.oilTook < 1 && game.text39 == 1)
   {
      registerWalkZone(this);
   }
}
