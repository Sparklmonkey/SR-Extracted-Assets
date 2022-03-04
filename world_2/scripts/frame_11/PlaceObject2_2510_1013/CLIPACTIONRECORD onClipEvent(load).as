onClipEvent(load){
   _visible = false;
   if(root.crntEvent.id == 5)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         _visible = true;
      }
   }
}
