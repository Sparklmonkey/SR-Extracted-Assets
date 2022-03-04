onClipEvent(load){
   drawBubble = function(msg, emoType)
   {
      var _loc1_ = this;
      _loc1_.msg = msg;
      _loc1_.emoType = emoType;
      trace("MSG :" + _loc1_.msg.length);
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
      timeCheck = 500;
      _loc1_.onEnterFrame = function()
      {
         if(--timeCheck <= 0)
         {
            hideBubble();
         }
      };
   };
   hideBubble = function()
   {
      this.gotoAndStop(1);
   };
}
