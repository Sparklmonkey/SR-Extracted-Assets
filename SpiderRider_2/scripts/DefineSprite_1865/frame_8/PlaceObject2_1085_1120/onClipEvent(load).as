onClipEvent(load){
   this.onPress = function()
   {
      this.gotoAndStop("down");
      quitFct = function()
      {
         root.killNetConnection();
         root.askWindow.closeWindow();
         root.updatePlayer();
         stopAllSounds();
         root.gotoAndStop("initialise");
         delete _parent.endFct;
      };
      root.sfx.gotoAndPlay("clic");
      root.askWindow.drawWindow([root.getInsName("txtLogout",root.parseKitSheets)],quitFct);
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
