onClipEvent(load){
   this.onPress = function()
   {
      var _loc1_ = _parent;
      this.gotoAndStop("down");
      §§push(_loc1_);
      if(_loc1_.oldTypeBody)
      {
         _loc1_.resetPerso();
      }
      _loc1_.saveInfoSpider();
      root.updatePlayer();
      root.sfx.gotoAndPlay("clic");
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
