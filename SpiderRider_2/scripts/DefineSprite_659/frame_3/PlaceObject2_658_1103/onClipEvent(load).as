onClipEvent(load){
   this.onPress = function()
   {
      fct = function()
      {
         root.tradeWindow.sendQuitModule();
         root.tradeWindow.popWait.drawMsg(root.getInsName("msgTradLeav",root.parseKitCards));
         root.tradeWindow.popUp.gotoAndPlay("close");
      };
      _parent.popUp.drawWindow(root.getInsName("msgTradQuit",root.parseKitCards),fct);
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
   };
   this.onReleaseOutside = function()
   {
      this.gotoAndStop("up");
   };
}
