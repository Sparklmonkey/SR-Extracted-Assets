onClipEvent(load){
   this.onRollOver = function()
   {
      this.tooltip._visible = true;
   };
   this.onRollOut = function()
   {
      this.tooltip._visible = false;
   };
   this.onReleaseOutside = function()
   {
      this.tooltip._visible = false;
   };
   this.onRelease = function()
   {
      this.tooltip._visible = false;
   };
}
