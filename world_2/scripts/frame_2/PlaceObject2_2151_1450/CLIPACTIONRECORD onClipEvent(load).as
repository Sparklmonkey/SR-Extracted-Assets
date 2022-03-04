onClipEvent(load){
   this.onPress = function()
   {
      this.gotoAndStop("down");
      root.sfx.gotoAndPlay("clic2");
      if(root.deckActive == "A")
      {
         root.deckActive = "B";
      }
      else if(root.deckActive == "B")
      {
         root.deckActive = "C";
      }
      else
      {
         root.deckActive = "A";
      }
      _parent.activeDeck.gotoAndStop(root.deckActive);
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
