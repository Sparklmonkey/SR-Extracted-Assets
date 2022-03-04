onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.char.char.gotoAndStop("pickUp");
      game.frag4Floor._visible = false;
      game.addObject("frag4");
      game.frag4 = 1;
      game.unregisterWalkZone(this);
   };
   if(game.frag4 == 0)
   {
      game.registerWalkZone(this);
   }
}
