onClipEvent(load){
   if(root.crntEvent.id == 1)
   {
      if(root.crntEvent.state == "collect")
      {
         gotoAndStop(2);
      }
      else if(root.crntEvent.state == "sprint")
      {
         gotoAndStop(3);
      }
   }
}
