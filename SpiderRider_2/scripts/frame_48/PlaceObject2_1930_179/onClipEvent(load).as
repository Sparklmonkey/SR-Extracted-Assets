onClipEvent(load){
   drawBubble = function(msg, emoType)
   {
      var _loc1_ = this;
      _loc1_.msg = msg;
      _loc1_.emoType = emoType;
      trace("MSG :" + _loc1_.msg.length);
      §§push(_loc1_);
      if(_loc1_.msg.length < 1)
      {
         _loc1_.contentLength = 1;
      }
      else if(_loc1_.msg.length <= 11)
      {
         _loc1_.contentLength = 2;
      }
      else if(_loc1_.msg.length <= 24)
      {
         _loc1_.contentLength = 3;
      }
      else
      {
         _loc1_.contentLength = 4;
      }
      trace("drawBubble");
      trace("CONTENT :" + _loc1_.contentLength);
      trace("msg :" + msg);
      trace("emoType :" + emoType);
      _loc1_.gotoAndPlay("show");
      timeCheck = 200;
      _loc1_ = §§pop();
   };
   hideBubble = function()
   {
      this.gotoAndStop(1);
   };
   this.onEnterFrame = function()
   {
      var _loc1_ = this;
      §§push(_loc1_);
      if(_loc1_._currentframe != 1)
      {
         if(root.emptyClip.char._x + 320 <= 100)
         {
            _loc1_._x = root.emptyClip.char._x + 100 + 320;
            _loc1_._y = root.emptyClip.char._y - 240;
            if(_loc1_.bubble.bubble.bubble._currentframe == 1)
            {
               _loc1_.bubble.bubble.bubble.gotoAndStop(2);
            }
         }
         else
         {
            _loc1_._x = root.emptyClip.char._x + 320;
            _loc1_._y = root.emptyClip.char._y - 240;
            if(_loc1_.bubble.bubble.bubble._currentframe == 2)
            {
               _loc1_.bubble.bubble.bubble.gotoAndStop(1);
            }
         }
         if(--timeCheck <= 0)
         {
            hideBubble();
         }
      }
      _loc1_ = §§pop();
   };
}
