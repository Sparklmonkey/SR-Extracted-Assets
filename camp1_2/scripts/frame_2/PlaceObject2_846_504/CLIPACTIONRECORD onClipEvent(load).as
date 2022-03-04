onClipEvent(load){
   this.onPress = function()
   {
      this.gotoAndStop("down");
      root.tweenStop = true;
      root.upPanel.endFct = root.charWindow.drawWindow;
      root.askWindow.closeWindow();
      trace(root.playerStats.reward);
      root.upPanel.gotoAndPlay("close");
      root.downPanel.gotoAndPlay("close");
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
