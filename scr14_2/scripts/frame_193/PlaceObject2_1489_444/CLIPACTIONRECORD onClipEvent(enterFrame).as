onClipEvent(enterFrame){
   if(game.balsam == 0)
   {
      _visible = true;
   }
   else
   {
      _visible = false;
   }
   this.onRelease = function()
   {
   };
   _alpha = 0;
}
