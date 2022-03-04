onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.char.char.gotoAndStop("pickUp");
      game.frag3Floor._visible = false;
      game.addObject("frag3");
      game.frag3 = 1;
      game.unregisterWalkZone(this);
   };
   if(game.frag3 == 0)
   {
      game.registerWalkZone(this);
   }
}
