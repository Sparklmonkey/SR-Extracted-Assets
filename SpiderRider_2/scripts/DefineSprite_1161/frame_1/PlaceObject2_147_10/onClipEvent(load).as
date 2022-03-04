onClipEvent(load){
   numCamp = _parent._parent._parent.selCamp;
   switch(numCamp)
   {
      case "1":
         webcode = root.webcodeArray[0];
         break;
      case "2":
         webcode = root.webcodeArray[1];
         break;
      case "3":
         webcode = root.webcodeArray[2];
         break;
   }
   this.onPress = function()
   {
      var _loc1_ = _parent;
      root.sfx.gotoAndPlay("clic");
      trace(_loc1_.webcodeTxt.text + " ; " + webcode);
      §§push(_loc1_);
      if(_loc1_.webcodeTxt.text == webcode)
      {
         _loc1_.webcodeTxt.text = "";
         root.so.data["camp" + numCamp] = webcode;
         root.so.flush();
         _loc1_._parent.gotoAndStop("hide");
      }
      else
      {
         _loc1_.webcodeTxt.text = "??????";
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
