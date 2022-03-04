onClipEvent(load){
   function drawWindow()
   {
      openWindow();
   }
   function openWindow()
   {
      _visible = true;
      this.gotoAndPlay("open");
   }
   function closeWindow()
   {
      this.gotoAndPlay("close");
   }
}
