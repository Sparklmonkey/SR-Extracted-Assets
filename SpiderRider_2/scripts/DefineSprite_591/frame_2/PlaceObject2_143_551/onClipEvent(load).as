onClipEvent(load){
   this.onPress = function()
   {
      var _loc1_ = _parent;
      this.gotoAndStop("down");
      root.sfx.gotoAndPlay("clic");
      _loc1_.questionTxt = root.getInsName("msgDelCard2",root.parseKitCards);
      delete cardID;
      _loc1_.cardName = _loc1_.cardAcqObj.cTitle;
      _loc1_.popUp.gotoAndPlay("show");
      _loc1_;
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
