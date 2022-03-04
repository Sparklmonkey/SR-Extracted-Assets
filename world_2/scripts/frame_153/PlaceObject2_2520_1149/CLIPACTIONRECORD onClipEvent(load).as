onClipEvent(load){
   if(root.crntEvent.id == 8)
   {
      if(root.crntEvent.state == "result")
      {
         gotoAndStop("C");
      }
      else
      {
         gotoAndStop("No");
      }
   }
   else
   {
      gotoAndStop("C");
   }
}
