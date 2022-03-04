onClipEvent(load){
   this.onPress = function()
   {
      var _loc1_ = _parent;
      this.gotoAndStop("down");
      _loc1_.spiderChange = true;
      _loc1_.sprSex = random(2) + 1;
      _loc1_.sproffSet = sprSex != 1?4:0;
      _loc1_.sprBody = random(4) + 1;
      _loc1_.sprHead = random(4) + 1;
      _loc1_.sprLegs = random(3) + 1;
      _loc1_.refreshPerso();
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
