onClipEvent(load){
   function drawWindow()
   {
      openWindow();
   }
   function openWindow()
   {
      gotoAndStop("open");
      play();
   }
   function closeWindow()
   {
      gotoAndStop("close");
      play();
   }
}
