onClipEvent(load){
   this.onPress = function()
   {
      this.gotoAndStop("down");
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
      _parent.doSendChatMessage();
   };
   this.onReleaseOutside = function()
   {
      this.gotoAndStop("up");
   };
}
