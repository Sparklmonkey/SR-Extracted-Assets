onClipEvent(load){
   this.onPress = function()
   {
      var _loc2_ = _parent;
      this.gotoAndStop("down");
      var _loc1_ = 1;
      while(_loc1_ <= 4)
      {
         _loc2_._parent["guild" + _loc1_].gotoAndStop(1);
         _loc1_ = _loc1_ + 1;
      }
      _loc2_.guild1.gotoAndStop(2);
      _loc2_.guild = 1;
      root.upPanel.endFct = function()
      {
         _parent.gotoAndStop("guildDesc");
      };
      root.sfx.gotoAndPlay("clic2");
      root.upPanel.gotoAndPlay("close");
      root.downPanel.gotoAndPlay("close");
      _loc2_;
      _loc1_;
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
