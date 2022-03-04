onClipEvent(load){
   this.onPress = function()
   {
      this.gotoAndStop("down");
      root.tweenStop = true;
      root.upPanel.endFct = function()
      {
         root.charWindow.drawWindow3();
      };
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
