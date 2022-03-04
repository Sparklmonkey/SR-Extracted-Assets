onClipEvent(load){
   this.onPress = function()
   {
      var _loc1_ = _parent;
      _loc1_._parent.selCamp = "1";
      §§push(_loc1_);
      if(root.so.data.camp1 == null || root.so.data.camp1 == undefined)
      {
         _loc1_._parent.webcode.gotoAndStop("show");
      }
      else
      {
         _loc1_._parent.gotoAndPlay("hide");
      }
      _loc1_ = §§pop();
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
