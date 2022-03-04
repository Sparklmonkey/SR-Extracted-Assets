onClipEvent(load){
   function drawScroller()
   {
      trace("drawScroller");
      this.gotoAndStop(2);
   }
   function closeScroller()
   {
      trace("closeScroller");
      this.gotoAndStop("hide");
   }
}
