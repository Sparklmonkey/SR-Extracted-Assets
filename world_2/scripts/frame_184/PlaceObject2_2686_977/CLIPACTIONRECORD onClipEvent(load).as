onClipEvent(load){
   if(root.crntEvent.id == 4)
   {
      if(root.crntEvent.state == "collect")
      {
         this.gotoAndStop(2);
      }
      else if(root.crntEvent.state == "sprint")
      {
         this.gotoAndStop(3);
      }
      else
      {
         this.gotoAndStop(4);
      }
   }
}
