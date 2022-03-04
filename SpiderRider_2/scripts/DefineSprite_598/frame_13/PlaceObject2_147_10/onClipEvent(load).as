onClipEvent(load){
   this.onPress = function()
   {
      this.gotoAndStop("down");
      _parent.loadTxt(++page);
      root.sfx.gotoAndPlay("clic");
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
