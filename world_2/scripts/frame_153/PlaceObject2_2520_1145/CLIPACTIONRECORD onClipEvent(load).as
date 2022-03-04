onClipEvent(load){
   if(root.crntEvent.id == 8)
   {
      if(root.crntEvent.state == "result")
      {
         gotoAndStop("D");
      }
      else
      {
         gotoAndStop("No");
      }
   }
   else
   {
      gotoAndStop("D");
   }
}
