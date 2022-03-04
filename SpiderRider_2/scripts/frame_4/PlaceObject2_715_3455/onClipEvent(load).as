onClipEvent(load){
   function drawWindow(typeStore)
   {
      gotoAndStop(typeStore);
      _visible = true;
   }
   function closeWindow()
   {
      gotoAndStop("close");
      _visible = false;
   }
}
