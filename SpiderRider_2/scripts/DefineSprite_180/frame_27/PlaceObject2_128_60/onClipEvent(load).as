onClipEvent(load){
   this.onPress = function()
   {
      var _loc1_ = _parent;
      this.gotoAndStop("down");
      root.sfx.gotoAndPlay("clic1");
      §§push(_loc1_);
      if(!(_loc1_.user_txt.text == "" || _loc1_.pass_txt.text == ""))
      {
         root.showTextSheet = true;
         root.sfx.gotoAndPlay("clic1");
         root.tryLogin(_loc1_.user_txt.text,_loc1_.pass_txt.text);
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
