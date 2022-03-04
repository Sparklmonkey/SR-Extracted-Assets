onClipEvent(load){
   function loadTxt(nbrPage)
   {
      if(nbrPage < array.length)
      {
         textBox.text = array[nbrPage];
      }
      else
      {
         fct();
         closeWindow();
      }
   }
   function drawWindow(array, ico, fct)
   {
      var _loc1_ = this;
      page = 0;
      _loc1_.ico = ico;
      _loc1_.fct = fct;
      _loc1_.array = array;
      openWindow();
      _loc1_;
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
