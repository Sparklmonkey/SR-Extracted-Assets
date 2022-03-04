class UI.controls.UIScrollBar.BasicScrollBar extends UI.core.events
{
   var __size = 0;
   var minPos = 0;
   var maxPos = 0;
   var pageSize = 0;
   var trackDecriment = 26;
   var _scrollPosition = 0;
   function BasicScrollBar()
   {
      super();
      this.__enabled = true;
      this.__prefix = "V";
      this.attachMovie("ScrollBar_Track","__track",0);
      this.createEmptyMovieClip("__HSpace",1);
      this.createEmptyMovieClip("__VSpace",2);
      this.attachMovie("ScrollBarThumb","thumb",3);
      this.draw("V");
      var o = this;
      this.__track.onPress = function()
      {
         o.onTrackDown();
      };
      this.__track.onRelease = this.__track.onReleaseOutside = function()
      {
         o.onTrackUp();
      };
      this.notab(this.__track);
      this.__track.useHandCursor = false;
      this.setState(2);
      this.thumb.setState(2);
   }
   function onTrackDown()
   {
      var _loc3_ = this._ymouse - this.trackDecriment;
      var _loc2_ = _loc3_ * (this.maxPos - this.minPos) / (this.__size - this.trackDecriment - this.thumb._height) - this.minPos + this.trackDecriment;
      if(_loc2_ < this.__get__scrollPosition())
      {
         this.onTrakInt(this,true,_loc2_);
         this.trackInt = setInterval(this.onTrakInt,200,this,true,_loc2_);
      }
      else
      {
         this.onTrakInt(this,false,_loc2_);
         this.trackInt = setInterval(this.onTrakInt,200,this,false,_loc2_);
      }
   }
   function onTrakInt(p, mv, ov)
   {
      var _loc4_ = p._ymouse - this.trackDecriment;
      var _loc5_ = Math.round(_loc4_ * (p.maxPos - p.minPos) / (p.__size - p.trackDecriment - p.thumb._height) - p.minPos);
      var _loc3_ = p.thumb._height;
      if(mv == true)
      {
         p.scrollPosition = Math.max(p.scrollPosition - _loc3_,p.minPos);
      }
      else
      {
         p.scrollPosition = Math.min(p.scrollPosition + _loc3_,p.maxPos);
      }
   }
   function onTrackUp()
   {
      clearInterval(this.trackInt);
   }
   function onSetFocus()
   {
   }
   function set scrollPosition(pos)
   {
      pos = this.Fix(pos);
      this._scrollPosition = pos;
      this.dispatchEvent("scroll",{target:this,scrollPosition:pos});
      if(this.isScrolling != true)
      {
         var _loc3_ = this.getY(pos) + 6;
         this.thumb._y = _loc3_;
      }
   }
   function setPosThumb(pos)
   {
      if(pos < this.minPos)
      {
         pos = this.minPos;
      }
      if(pos > this.maxPos)
      {
         pos = this.maxPos;
      }
      this._scrollPosition = pos;
      if(this.isScrolling != true)
      {
         pos = Math.min(pos,this.maxPos);
         pos = Math.max(pos,this.minPos);
         var _loc3_ = this.getY(pos);
         this.thumb._y = _loc3_;
      }
      this.dispatchEvent("scroll",{target:this,scrollPosition:pos});
   }
   function set enabled(e)
   {
      if(e == true && this.__enabled == false)
      {
         this.setState(2);
         this.thumb.setState(2);
      }
      if(e == false)
      {
         this.setState(1);
         this.thumb.setState(1);
      }
      this.__enabled = e;
   }
   function get enabled()
   {
      return this.__enabled;
   }
   function get scrollPosition()
   {
      return this._scrollPosition;
   }
   function setScrollProperties(size, min, max)
   {
      this.pageSize = size;
      this.minPos = Math.max(min,0);
      this.maxPos = Math.max(max,0);
      this.resizeThumb();
      var _loc2_ = this.Fix(this.__get__scrollPosition());
      this.__set__scrollPosition(_loc2_);
   }
   function Fix(n)
   {
      if(n < this.minPos)
      {
         n = this.minPos;
      }
      if(n > this.maxPos)
      {
         n = this.maxPos;
      }
      return n;
   }
   function resizeThumb()
   {
      var _loc3_ = this.__size - this.trackDecriment;
      var _loc2_ = this.pageSize / (this.maxPos - this.minPos + this.pageSize) * (this.__size - this.trackDecriment);
      this.thumb.clear();
      this.thumb.setSize(_loc2_);
   }
   function getY(value)
   {
      var _loc2_ = (value - this.minPos) * (this.__size - this.trackDecriment - this.thumb._height) / (this.maxPos - this.minPos) + 7;
      return _loc2_;
   }
   function getValue(y)
   {
      return (y - 13) * (this.maxPos - this.minPos) / (this.__size - this.trackDecriment - this.thumb._height);
   }
   function setSize(size)
   {
      this.__size = size;
      if(size <= 39)
      {
         this.thumb._visible = false;
      }
      else
      {
         this.thumb._visible = true;
      }
      if(this.__direction == "Horizontal")
      {
         this.__track.gotoAndStop(2);
         this.__track._width = size;
         this.__track._height = 13;
      }
      else
      {
         this.__track.gotoAndStop(1);
         this.__track._height = size;
         this.__track._width = 13;
         var _loc3_ = this.__VSpace;
         _loc3_.down._y = size - _loc3_.down._height;
      }
      this.resizeThumb();
      this.hitArea = this.__track;
   }
   function setState(i, t)
   {
      var _loc2_ = "down";
      if(t == 1)
      {
         _loc2_ = "up";
      }
      var _loc3_ = this["__" + this.__prefix + "Space"][_loc2_];
      _loc3_.gotoAndStop(i);
   }
   function draw(prefix)
   {
      var _loc2_ = this["__" + prefix + "Space"];
      _loc2_.attachMovie("ScrollBar_" + prefix + "Down","down",0);
      _loc2_.attachMovie("ScrollBar_" + prefix + "Up","up",1);
      var owner = this;
      this.notab(_loc2_.down);
      this.notab(_loc2_.up);
      _loc2_.down.onPress = function()
      {
         owner.scrollDown(this);
      };
      _loc2_.up.onPress = function()
      {
         owner.scrollUp(this);
      };
      _loc2_.down.onRollOver = function()
      {
         owner.setState(3,0);
      };
      _loc2_.up.onRollOver = function()
      {
         owner.setState(3,1);
      };
      _loc2_.down.onRollOut = function()
      {
         owner.setState(2,0);
      };
      _loc2_.up.onRollOut = function()
      {
         owner.setState(2,1);
      };
      _loc2_.down.onReleaseOutside = function()
      {
         owner.releaseScroll(this,0);
      };
      _loc2_.up.onReleaseOutside = function()
      {
         owner.releaseScroll(this,1);
      };
      _loc2_.down.onRelease = function()
      {
         owner.releaseScrollOver(this,0);
      };
      _loc2_.up.onRelease = function()
      {
         owner.releaseScrollOver(this,1);
      };
      this.notab(this.thumb);
      this.thumb.onPress = function()
      {
         owner.scrollThumb();
      };
      this.thumb.onRelease = function()
      {
         owner.releaseThumbOver();
      };
      this.thumb.onReleaseOutside = function()
      {
         owner.releaseThumb();
      };
      this.thumb.onRollOver = function()
      {
         if(owner.__enabled == true && this.activeState != 4)
         {
            this.setState(3);
         }
      };
      this.thumb.onRollOut = function()
      {
         if(owner.__enabled == true && this.activeState != 4)
         {
            this.setState(2);
         }
      };
      this.thumb.useHandCursor = _loc2_.up.useHandCursor = _loc2_.down.useHandCursor = false;
   }
   function releaseThumbOver()
   {
      if(this.__enabled == true)
      {
         this.isScrolling = false;
         this.thumb.setState(3);
         this.onMouseMove = null;
      }
   }
   function releaseThumb()
   {
      if(this.__enabled == true)
      {
         this.isScrolling = false;
         this.thumb.setState(2);
         this.onMouseMove = null;
      }
   }
   function releaseScrollOver(mc)
   {
      if(this.__enabled == true)
      {
         mc.gotoAndStop(3);
         this.releaseScroll();
      }
   }
   function releaseScroll(mc)
   {
      if(this.__enabled == true)
      {
         mc.gotoAndStop(2);
         clearInterval(this.scrolling);
      }
   }
   function scrollUp(mc)
   {
      if(this.__enabled == true)
      {
         mc.gotoAndStop(4);
         this.scrollIt("one",-1);
         this.scrolling = setInterval(this.scrollInterval,200,"one",-1,this);
      }
   }
   function scrollDown(mc)
   {
      if(this.__enabled == true)
      {
         mc.gotoAndStop(4);
         this.scrollIt("one",1);
         this.scrolling = setInterval(this.scrollInterval,200,"one",1,this);
      }
   }
   function scrollInterval(inc, mode, ref)
   {
      clearInterval(ref.scrolling);
      if(inc != "page")
      {
         ref.scrollIt(inc,mode);
      }
      ref.scrolling = setInterval(ref.scrollInterval,40,inc,mode,ref);
   }
   function scrollIt(inc, mode)
   {
      var _loc3_ = 1;
      var _loc2_ = this.__get__scrollPosition() + mode * _loc3_;
      _loc2_ = this.Fix(_loc2_);
      this.__set__scrollPosition(_loc2_);
   }
   function trackScroller()
   {
      if(this.thumb._y + this.thumb._height < this._ymouse)
      {
         this.scrollIt("page",1);
      }
      else if(this.thumb._y > this._ymouse)
      {
         this.scrollIt("page",-1);
      }
   }
   function get max()
   {
      return this.maxPos;
   }
   function scrollThumb()
   {
      if(this.__enabled == true)
      {
         this.lastY = this.thumb._ymouse;
         this.onMouseMove = this.dragThumb;
      }
   }
   function dragThumb()
   {
      var _loc2_ = this._ymouse - this.lastY;
      if(_loc2_ < 13)
      {
         _loc2_ = 13;
      }
      var _loc3_ = this.__size - 13 - this.thumb._height;
      if(_loc2_ > _loc3_)
      {
         _loc2_ = _loc3_;
      }
      this.thumb._y = _loc2_;
      var _loc5_ = this.__size - this.trackDecriment;
      var _loc4_ = this.getValue(this.thumb._y) + 1;
      this.setPosThumb(_loc4_);
      this.isScrolling = true;
   }
}
