onClipEvent(load){
   this.onPress = function()
   {
      var _loc1_ = _parent;
      root.sfx.gotoAndPlay("clic");
      root.addGils(- Number(_loc1_._parent.cardCost));
      trace(Number(_loc1_._parent.cardCost) + "COSSSSSSSSST");
      root.updateCard(Number(_loc1_._parent.cardID));
      _loc1_._parent._parent.showCard();
      _loc1_._visible = false;
      this.onEnterFrame = function()
      {
         if(!root.waitingForReply)
         {
            delete this.onEnterFrame;
            _parent._parent.gotoAndPlay("hide");
         }
      };
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
