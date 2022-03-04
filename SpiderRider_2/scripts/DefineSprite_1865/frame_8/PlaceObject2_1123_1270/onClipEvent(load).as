onClipEvent(load){
   this.onPress = function()
   {
      this.gotoAndStop("down");
      root.upPanel.endFct = function()
      {
         _parent.gotoAndStop("spiderSheet");
      };
      root.sfx.gotoAndPlay("clic2");
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
