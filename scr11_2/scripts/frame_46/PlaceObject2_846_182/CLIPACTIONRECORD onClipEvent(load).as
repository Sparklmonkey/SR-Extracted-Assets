onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.gold3 = 1;
      game.golds = game.golds + 1;
      game.action6 = 0;
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.gold3._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.char.char.pickUpFct();
      if(game.golds == 1)
      {
         game.addObject("gold1");
      }
      if(game.golds == 2)
      {
         game.removeObject("gold1");
         game.addObject("gold2");
      }
      if(game.golds == 3)
      {
         game.removeObject("gold2");
         game.addObject("gold3");
      }
      game.unregisterWalkZone(this);
   };
   if(game.action6 == 1)
   {
      game.registerWalkZone(this);
   }
}
