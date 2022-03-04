onClipEvent(load){
   function loadTxt(nbrPage)
   {
      if(nbrPage < array.length)
      {
         textBox.text = array[nbrPage];
      }
      else if(root._currentframe > 3)
      {
         fct();
      }
      else
      {
         fct();
         closeWindow();
      }
   }
   function drawWindow(array, popFct)
   {
      var _loc1_ = this;
      page = 0;
      delete register1.fct;
      _loc1_.fct = popFct;
      _loc1_.cancelFct = closeWindow;
      _loc1_.array = array;
      delete popFct;
      openWindow();
      _loc1_;
   }
   function drawWindow2(array, fctOk, fctClose)
   {
      var _loc1_ = this;
      page = 0;
      _loc1_.fct = function()
      {
         fctOk();
         closeWindow();
      };
      _loc1_.cancelFct = function()
      {
         fctClose();
         closeWindow();
      };
      _loc1_.array = array;
      openWindow();
      _loc1_;
   }
   openWindow = function()
   {
      _visible = true;
      this.gotoAndPlay("open");
   };
   closeWindow = function()
   {
      this.gotoAndPlay("close");
   };
}
