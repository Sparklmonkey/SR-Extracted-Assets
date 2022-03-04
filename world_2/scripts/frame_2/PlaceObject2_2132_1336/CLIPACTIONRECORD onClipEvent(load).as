onClipEvent(load){
   this.onPress = function()
   {
      this.gotoAndStop("down");
      root.chatWindow.drawWindow();
      root.sfx.gotoAndPlay("clic2");
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
