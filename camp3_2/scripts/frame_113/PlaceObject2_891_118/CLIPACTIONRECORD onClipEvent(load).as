onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.char.char.gotoAndStop("pickUp");
      game.frag2Floor._visible = false;
      game.addObject("frag2");
      game.frag2 = 1;
      game.unregisterWalkZone(this);
   };
   if(game.frag2 == 0)
   {
      game.registerWalkZone(this);
   }
}
