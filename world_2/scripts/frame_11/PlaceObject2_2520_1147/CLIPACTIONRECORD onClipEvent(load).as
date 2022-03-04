onClipEvent(load){
   gotoAndStop("B");
   if(root.crntEvent.id == 1)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         gotoAndStop("No");
      }
   }
}
