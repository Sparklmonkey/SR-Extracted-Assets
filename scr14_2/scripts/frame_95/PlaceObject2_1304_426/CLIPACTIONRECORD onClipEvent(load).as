onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.text3 == 1)
      {
         game.neckless = 1;
         game.text3 = 2;
         game.char.char.gotoAndStop("pickUp");
         game.char.char.pickUpFct = function()
         {
            game.itemContainer.neckless1._visible = false;
            delete game.char.char.pickUpFct;
         };
         game.char.char.pickUpFct();
         game.addObject("neckless");
         game.unregisterWalkZone(this);
      }
   };
   if(game.text3 == 1)
   {
      game.registerWalkZone(this);
   }
}
