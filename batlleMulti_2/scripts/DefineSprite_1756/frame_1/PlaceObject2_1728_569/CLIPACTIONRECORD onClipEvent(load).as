onClipEvent(load){
   function Show()
   {
      _X = 0;
      _visible = true;
   }
   function Hide()
   {
      _X = 999;
      _visible = true;
   }
   this.swapDepths(100000);
   Hide();
}
