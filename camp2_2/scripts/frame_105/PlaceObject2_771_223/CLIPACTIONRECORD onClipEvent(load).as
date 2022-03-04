onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.char.char.gotoAndStop("pickUp");
      game.itemContainer.secretPlace1._visible = false;
      game.placeObject(0,11,11,"KeyItem",1);
      game.registerWalkZone(game.keyZone);
      game.digHole = 1;
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger == 4 && game.digHole < 1)
   {
      game.registerWalkZone(this);
   }
}
