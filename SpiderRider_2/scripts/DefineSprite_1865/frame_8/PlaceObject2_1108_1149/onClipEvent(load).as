onClipEvent(load){
   this.onPress = function()
   {
      var _loc1_ = _parent;
      this.gotoAndStop("down");
      §§push(_loc1_);
      if(_loc1_.spiderChange || _loc1_.charChange)
      {
         endFct = function()
         {
            var _loc1_ = _parent;
            root.showTextSheet = false;
            §§push(_loc1_);
            if(_loc1_.spiderChange)
            {
               _loc1_.spiderChange = false;
            }
            if(_loc1_.charChange)
            {
               _loc1_.charChange = false;
            }
            if(root.inCamp == true)
            {
               root.charWindow.closeWindow();
            }
            else
            {
               _loc1_.popUp.gotoAndPlay("show");
            }
            _loc1_ = §§pop();
         };
         if(_loc1_.charChange)
         {
            root.askWindow.drawWindow([root.getInsName("txtNotSaveChar",root.parseKitSheets)],endFct);
         }
         else
         {
            root.askWindow.drawWindow([root.getInsName("txtNotSaveSpi",root.parseKitSheets)],endFct);
         }
      }
      else if(root.inCamp == true)
      {
         root.charWindow.closeWindow();
      }
      else
      {
         _loc1_.popUp.gotoAndPlay("show");
      }
      root.sfx.gotoAndPlay("clic2");
      _loc1_ = §§pop();
   };
   this.onRollOver = function()
   {
      this.gotoAndStop("over");
   };
   this.onRollOut = function()
   {
      this.gotoAndStop("up");
   };
   this.onRelease = function()
   {
      this.gotoAndStop("up");
   };
   this.onReleaseOutside = function()
   {
      this.gotoAndStop("up");
   };
}
