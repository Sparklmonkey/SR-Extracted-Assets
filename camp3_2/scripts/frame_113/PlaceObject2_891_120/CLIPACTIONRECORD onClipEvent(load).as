onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.char.char.gotoAndStop("pickUp");
      game.frag1Floor._visible = false;
      game.addObject("frag1");
      game.frag1 = 1;
      game.unregisterWalkZone(this);
   };
   if(game.frag1 == 0)
   {
      game.registerWalkZone(this);
   }
}
