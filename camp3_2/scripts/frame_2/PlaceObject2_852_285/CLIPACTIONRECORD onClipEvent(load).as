onClipEvent(load){
   this.onPress = function()
   {
      this.gotoAndStop("down");
      endFct = function()
      {
         root.updatePlayer();
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.victoryPtsOffset = root.playerStats.victory;
      root.textWindow.drawWindow([root.getInsName("txtSave",root.parseKitWorld)],0,endFct);
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
