onClipEvent(load){
   function loadTxt(nbrPage)
   {
      var _loc1_ = this;
      var _loc2_ = nbrPage;
      §§push(_loc1_);
      §§push(_loc2_);
      if(_loc2_ < array.length)
      {
         crntStr = array[_loc2_];
         crntStr = crntStr.toLowerCase();
         t = 0;
         while(t < charStr.length)
         {
            charInd = crntStr.indexOf(charStr[t]);
            if(charInd > 0)
            {
               tlkAbtImg = charStr[t];
               _loc1_.altImg._visible = true;
               break;
            }
            tlkAbtImg = "none";
            _loc1_.altImg._visible = false;
            t++;
         }
         trace("altImg = " + tlkAbtImg);
         _loc1_.altImg.img.gotoAndStop(tlkAbtImg);
         textBox.text = array[_loc2_];
      }
      else
      {
         closeWindow();
      }
      _loc2_ = §§pop();
      _loc1_ = §§pop();
   }
   function drawWindow(array, ico, popFct)
   {
      var _loc1_ = this;
      page = 0;
      delete register1.fct;
      _loc1_.ico = ico;
      _loc1_.fct = popFct;
      _loc1_.array = array;
      delete popFct;
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
   charStr = new Array("oracle","healer","woodman","corona","blacksmith","craftman","chamberlain","lumens","igneous","sparkle","aquine","buguese","grasshop","dungobeet","teacher","merchant","magma","stag","beerain","cathy");
}
