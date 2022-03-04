onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.womanbag = 1;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.womanbag3._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.addObject("womanbag");
      game.unregisterWalkZone(this);
   };
   if(game.womanbag < 1)
   {
      game.registerWalkZone(this);
   }
}
