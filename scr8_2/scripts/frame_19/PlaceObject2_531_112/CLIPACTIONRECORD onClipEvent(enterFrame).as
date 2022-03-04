onClipEvent(enterFrame){
   if(game.trigger3 == 1)
   {
      _visible = false;
   }
   else
   {
      _visible = true;
   }
   this.onRelease = function()
   {
   };
   _alpha = 0;
}
