onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.char.char.gotoAndStop("pickUp");
      game.frag5Floor._visible = false;
      game.addObject("frag5");
      game.frag5 = 1;
      game.unregisterWalkZone(this);
   };
   if(game.frag5 == 0)
   {
      game.registerWalkZone(this);
   }
}
