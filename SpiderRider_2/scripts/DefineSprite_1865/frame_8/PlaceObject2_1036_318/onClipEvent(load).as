onClipEvent(load){
   this.onPress = function()
   {
      var _loc1_ = _parent;
      this.gotoAndStop("down");
      §§push(_loc1_);
      if(_loc1_.armorCheck._currentframe == 2)
      {
         _loc1_.armorCheck.gotoAndStop(1);
         _loc1_.resetPerso();
      }
      _loc1_.tempSex = 1;
      if(_loc1_.typeSex != "male")
      {
         _loc1_.charChange = true;
         _loc1_.typeSex = "male";
      }
      root.sfx.gotoAndPlay("clic");
      _loc1_.emptyClip.gotoAndStop(_loc1_.typeSex);
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
