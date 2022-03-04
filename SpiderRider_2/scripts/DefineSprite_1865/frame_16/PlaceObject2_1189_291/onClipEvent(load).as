onClipEvent(load){
   this.onPress = function()
   {
      var _loc1_ = _parent;
      this.gotoAndStop("down");
      trace(_loc1_.sprSex + "/" + root.sprSex);
      §§push(_loc1_);
      if(root.sprSex == 2)
      {
         _loc1_.spiderChange = true;
         _loc1_.sprSex = root.sprSex = 1;
         _loc1_.sproffSet = 0;
         _loc1_.refreshPerso();
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
