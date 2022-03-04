onClipEvent(load){
   _visible = false;
   if(root.crntEvent.id == 11)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         _visible = true;
      }
   }
}
