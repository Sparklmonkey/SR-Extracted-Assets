onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.rope = 1;
      game.itemContainer.rope1._visible = false;
      game.addObject("rope");
      game.unregisterWalkZone(this);
   };
   if(game.rope < 1)
   {
      game.registerWalkZone(this);
   }
}
