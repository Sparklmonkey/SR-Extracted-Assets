onClipEvent(load){
   this.onPress = function()
   {
      this.gotoAndStop("down");
      root.sfx.gotoAndPlay("clic");
      _parent.gotoAndStop("instructions");
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
