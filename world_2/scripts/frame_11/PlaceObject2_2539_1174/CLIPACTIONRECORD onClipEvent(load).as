onClipEvent(load){
   if(root.crntEvent.id == 1)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         this.onRelease = function()
         {
         };
      }
   }
   _alpha = 0;
}
