onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.balsam = 1;
      game.text22 = 2;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.balsam1._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.char.char.pickUpFct();
      game.addObject("balsam");
      game.trigger5 = 1;
      game.unregisterWalkZone(this);
   };
   if(game.text22 == 1)
   {
      game.registerWalkZone(this);
   }
}
