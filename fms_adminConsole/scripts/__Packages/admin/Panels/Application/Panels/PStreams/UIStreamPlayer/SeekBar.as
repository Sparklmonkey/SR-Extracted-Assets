class admin.Panels.Application.Panels.PStreams.UIStreamPlayer.SeekBar extends UI.core.movieclip
{
   var __max = 0;
   var inDrag = false;
   function SeekBar()
   {
      super();
      this.createEmptyMovieClip("UISpace",0);
      this.attachMovie("StreamPlayer_pb","p_bar",1);
      this.attachMovie("StreamPlayer_pick","pick",2);
      this.p_bar._x = 1;
      this.p_bar._y = 1;
      this.pick._y = 9;
      var o = this;
      this.pick.onPress = function()
      {
         o.doDrag();
         o.dragMove();
      };
      this.pick.onRelease = this.pick.onReleaseOutside = function()
      {
         o.endDrag();
      };
      this.mListner = new Object();
      this.mListner.onMouseMove = function()
      {
         o.dragMove();
      };
      this.UISpace.onPress = function()
      {
         o.doDrag();
         o.dragMove();
      };
      this.UISpace.onRelease = this.UISpace.onReleaseOutside = function()
      {
         o.endDrag();
      };
      this.UISpace.useHandCursor = false;
   }
   function doDrag()
   {
      this.inDrag = true;
      this.dragMove();
      Mouse.addListener(this.mListner);
   }
   function dragMove()
   {
      var _loc2_ = this._xmouse;
      if(_loc2_ < 0)
      {
         _loc2_ = 0;
      }
      if(_loc2_ > this.__width)
      {
         _loc2_ = this.__width;
      }
      this.setPos(_loc2_ / this.__width * this.__max);
   }
   function endDrag()
   {
      this.inDrag = false;
      Mouse.removeListener(this.mListner);
      var _loc2_ = this._xmouse;
      if(_loc2_ < 0)
      {
         _loc2_ = 0;
      }
      if(_loc2_ > this.__width)
      {
         _loc2_ = this.__width;
      }
      this.setPos(_loc2_ / this.__width * this.__max);
      this.onChange(this.__lastPos);
   }
   function set max(m)
   {
      this.__max = m;
      this.setPos(this.__lastPos);
   }
   function set position(n)
   {
      if(this.inDrag != true)
      {
         this.setPos(n);
      }
   }
   function setPos(n)
   {
      var _loc2_ = this.__width / this.__max * n;
      this.p_bar._width = _loc2_;
      this.pick._x = _loc2_ - this.pick._width / 2;
      this.__lastPos = n;
   }
   function setSize(w)
   {
      this.__width = w - 2;
      this.UISpace.clear();
      this.drawRect(this.UISpace,0,0,w,8,0,0);
      this.drawRect(this.UISpace,0,0,w,1,0,35);
      this.drawRect(this.UISpace,0,1,1,8,0,35);
      this.drawRect(this.UISpace,1,8,w - 1,1,16777215,20);
      this.drawRect(this.UISpace,w - 1,1,1,7,16777215,20);
      this.setPos(this.__lastPos);
   }
}
