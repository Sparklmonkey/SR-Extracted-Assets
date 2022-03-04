onClipEvent(load){
   this.onPress = function()
   {
      if(root.currentV != 0)
      {
         root.setNewVolume(0);
         this.gotoAndStop(2);
      }
      else
      {
         root.setNewVolume(100);
         this.gotoAndStop(1);
      }
   };
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
