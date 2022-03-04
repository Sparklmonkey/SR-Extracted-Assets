onClipEvent(load){
   function drawWindow(msg)
   {
      this.msg = msg;
      openWindow();
   }
   function openWindow()
   {
      _visible = true;
      this.gotoAndPlay("open");
   }
}
