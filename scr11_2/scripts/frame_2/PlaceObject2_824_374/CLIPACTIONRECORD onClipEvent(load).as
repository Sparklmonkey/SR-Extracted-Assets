onClipEvent(load){
   this.onPress = function()
   {
      this.gotoAndStop("down");
      root.hideFriend(true);
      root.tweenStop = true;
      _parent.itemWindow.drawWindow();
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
