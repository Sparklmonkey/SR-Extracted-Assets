onClipEvent(load){
   this.onPress = function()
   {
      var _loc1_ = _parent;
      §§push(_loc1_);
      if(_loc1_.armorChange)
      {
         _loc1_.resetPerso();
      }
      _loc1_.saveInfoChar();
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
