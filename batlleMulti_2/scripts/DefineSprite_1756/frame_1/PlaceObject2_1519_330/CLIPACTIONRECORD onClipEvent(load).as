onClipEvent(load){
   function TraceFPS()
   {
      if(BATTLESYSTEM_DEBUG)
      {
         txt.text = "fps : " + frame;
         frame = 0;
      }
      else
      {
         txt.text = "";
      }
   }
   var frame = 0;
   setInterval(TraceFPS,1000);
   this.onEnterFrame = function()
   {
      frame++;
   };
   _visible = true;
}
