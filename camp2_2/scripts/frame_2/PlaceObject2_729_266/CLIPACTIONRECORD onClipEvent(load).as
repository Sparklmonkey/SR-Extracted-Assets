onClipEvent(load){
   function drawWindow()
   {
      page = 1;
      openWindow();
   }
   function openWindow()
   {
      _visible = true;
      gotoAndStop("open");
      play();
   }
   function closeWindow()
   {
      gotoAndStop(1);
   }
}
