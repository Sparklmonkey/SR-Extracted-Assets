onClipEvent(load){
   if(root.crntEvent.id == 1)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         gotoAndStop(2);
      }
   }
}
