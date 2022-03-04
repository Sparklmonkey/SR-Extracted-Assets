onClipEvent(load){
   this.onPress = function()
   {
      root.sfx.gotoAndPlay("clic");
      _parent.gameToClose.closeGame();
      _parent.gotoAndStop(1);
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
