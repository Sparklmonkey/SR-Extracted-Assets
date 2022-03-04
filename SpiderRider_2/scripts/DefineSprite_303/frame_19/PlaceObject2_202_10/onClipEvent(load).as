onClipEvent(load){
   this.onPress = function()
   {
      this.gotoAndStop("down");
      _parent.concernedGame.drawGame("single");
      root.sfx.gotoAndPlay("clic");
      _parent.closeWindow();
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
