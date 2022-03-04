onClipEvent(load){
   this.onPress = function()
   {
      this.gotoAndStop("down");
      root.sfx.gotoAndPlay("ButtonPressed");
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
      BattleSystem.AskForRetreat();
   };
   this.onReleaseOutside = function()
   {
      this.gotoAndStop("up");
   };
}
