onClipEvent(load){
   function drawWindow(msg)
   {
      trace("LOAD critic drawWindow");
      openWindow();
   }
   function openWindow()
   {
      trace("LOAD critic openWindow");
      _visible = true;
      gotoAndStop("open");
   }
   function closeWindow()
   {
      _visible = false;
      gotoAndStop(1);
   }
}
