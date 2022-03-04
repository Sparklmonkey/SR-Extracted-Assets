class UI.controls.LineChart extends UI.core.events
{
   var __scaleOffset = 24;
   var xSpacer = 5;
   var absoluteLabel = false;
   function LineChart()
   {
      super();
      this.__maxWidth = System.capabilities.screenResolutionX;
      this.createEmptyMovieClip("UISpace",0);
      this.createEmptyMovieClip("scaleLines",1);
      this.createEmptyMovieClip("lineHolder",2);
      this.createEmptyMovieClip("labelHolder",3);
      this.createEmptyMovieClip("peakLine",4);
      this.createEmptyMovieClip("linesMask",5);
      this.createEmptyMovieClip("checkSpace",6);
      this.createEmptyMovieClip("peakLabel",7);
      this.createEmptyMovieClip("hitSpace",8);
      this.peakLabel.attachMovie("Label","l1",0);
      this.peakLabel.l1.text = "";
      this.peakLabel.l1.autoSize = "left";
      this.peakLabel._visible = false;
      this.pRef = new Object();
      this.cRef = new Object();
      this.count = 0;
      this.lCount = 0;
      this.pos = 0;
      this.checkXPos = 0;
      this.lineData = new Array();
      this.__labels = new Array();
      this.__lineData = new Array();
      var owner = this;
      this.hitSpace.onRollOver = function()
      {
         owner.showHand();
      };
      this.hitSpace.onPress = function()
      {
         owner.showHand();
         owner.doPress();
      };
      this.hitSpace.onRelease = function()
      {
         owner.doRelease();
      };
      this.hitSpace.onReleaseOutside = function()
      {
         owner.doRelease();
         owner.hideHand();
      };
      this.hitSpace.onRollOut = function()
      {
         owner.hideHand();
      };
      this.notab(this.hitSpace);
      this.hitSpace.useHandCursor = false;
      this.mListner = new Object();
      this.lineHolder.setMask(this.linesMask);
      this.blockFocus();
   }
   function set maxWidth(w)
   {
      this.__maxWidth = w;
   }
   function doPress()
   {
   }
   function doRelease()
   {
   }
   function showHand()
   {
   }
   function hideHand()
   {
   }
   function registerProperty(id, color, label)
   {
      var _loc3_ = this.lineHolder.attachMovie("lineManager","lm" + this.count,this.count);
      _loc3_.setColor(color);
      _loc3_.lineStyle(20);
      _loc3_.peak = this.__min;
      var _loc2_ = this.checkSpace.attachMovie("CheckBox",id,this.count);
      _loc2_.label = "  " + label;
      _loc2_.setSize(_loc2_.width,20);
      _loc2_.attachMovie("LineChart_checkIco","ico_space",6);
      _loc2_.ico_space._x = 15;
      _loc2_.ico_space._y = 5;
      _loc2_.addListener("click",this.onClick,this);
      _loc2_.addListener("onRollOver",this.showPeak,this);
      _loc2_.addListener("onRollOut",this.hidePeak,this);
      _loc2_._x = this.__scaleOffset + this.checkXPos;
      this.checkXPos += _loc2_.width;
      var _loc6_ = new Color(_loc2_.ico_space);
      _loc6_.setRGB(color);
      this.count = this.count + 1;
      this.pRef[id] = _loc3_;
      this.cRef[id] = color;
   }
   function showPeak(data)
   {
   }
   function hidePeak()
   {
      this.peakLine.clear();
      this.peakLabel._visible = false;
   }
   function onClick(data)
   {
      this.pRef[data.target._name]._visible = data.target.selected;
      this.peakLine.clear();
      this.peakLabel._visible = false;
      this.dispatchEvent("onItemClick",{target:this,value:data.target._name,selected:data.target.selected});
   }
   function isVisible(id)
   {
      return this.pRef[id]._visible;
   }
   function push(data, save)
   {
      this.__lineData.push(data);
      this.drawPush(data);
   }
   function drawPush(data, s)
   {
      var _loc3_ = this.__scaleOffset + this.pos * this.xSpacer + 1;
      var _loc4_ = false;
      for(var _loc5_ in data)
      {
         _loc4_ = true;
         if(this.pos != 0)
         {
            this.pRef[_loc5_].lineTo(_loc3_,this.getY(data[_loc5_]),data[_loc5_]);
         }
         else
         {
            this.pRef[_loc5_].start(_loc3_,this.getY(data[_loc5_]));
         }
      }
      if(_loc3_ > this.__width)
      {
         this.lineHolder._x = this.__width - this.__scaleOffset - this.pos * this.xSpacer;
      }
      if(_loc4_ == true)
      {
         this.pos = this.pos + 1;
      }
   }
   function clear(saveHistory)
   {
      var _loc3_ = this.__lineData;
      if(saveHistory != true)
      {
         this.__lineData = new Array();
      }
      this.pos = 0;
      for(var _loc2_ in this.pRef)
      {
         this.pRef[_loc2_].clear();
         this.pRef[_loc2_].setColor(this.cRef[_loc2_]);
         this.pRef[_loc2_].lineStyle(20);
         this.pRef[_loc2_].peak = this.__min;
      }
      this.lineHolder._x = 0;
      return _loc3_;
   }
   function dump(p_data)
   {
      if(p_data.length > 0)
      {
         this.__lineData = p_data;
         var _loc5_ = Math.ceil(this.__width / this.xSpacer) + 1;
         if(p_data.length < _loc5_)
         {
            _loc5_ = p_data.length;
         }
         var _loc4_ = p_data.length - _loc5_;
         this.pos = 0;
         var _loc2_ = _loc4_;
         while(_loc2_ < p_data.length)
         {
            this.drawPush(p_data[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function resetScale(p_min, p_max)
   {
      var _loc6_ = 0;
      while(_loc6_ < this.__labels.length)
      {
         var _loc3_ = this.__labels[_loc6_];
         var _loc4_ = this.getY(_loc3_.val) - _loc3_.mc._height / 2;
         _loc3_.mc._y = _loc4_ + 2;
         _loc6_ = _loc6_ + 1;
      }
      this.scaleLines.clear();
      var _loc2_ = 0;
      while(_loc2_ < this.lineData.length)
      {
         _loc4_ = Math.round(this.getY(this.lineData[_loc2_]));
         this.drawRect(this.scaleLines,this.__scaleOffset,_loc4_,this.__width - this.__scaleOffset,1,14016740,100);
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = 0;
      for(_loc6_ in this.checkSpace)
      {
         this.checkSpace[_loc6_]._x = this.__scaleOffset + _loc5_;
         _loc5_ += this.checkSpace[_loc6_].width;
      }
   }
   function get max()
   {
      return this.__max;
   }
   function get min()
   {
      return this.__min;
   }
   function setScaleUI(p_min, p_max, valsToShow, linesToShow)
   {
      this.__max = p_max;
      this.__min = p_min;
      this.lineData = linesToShow;
      this.perVal = (this.__height - 20) / (p_max - p_min);
      var _loc2_ = 0;
      while(_loc2_ < this.__labels.length)
      {
         var _loc4_ = this.__labels[_loc2_];
         _loc4_.mc.removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.__labels = new Array();
      _loc2_ = 0;
      while(_loc2_ < valsToShow.length)
      {
         var _loc7_ = valsToShow[_loc2_];
         var _loc3_ = this.labelHolder.attachMovie("Label","l" + this.lCount,this.lCount);
         _loc3_.autoSize = "right";
         _loc3_._x = this.__scaleOffset - 5;
         if(this.absoluteLabel == false)
         {
            _loc3_.text = _loc7_;
            this.lCount = this.lCount + 1;
            var _loc5_ = this.getY(_loc7_) - _loc3_._height / 2;
            _loc3_._y = _loc5_;
            this.__labels.push({mc:_loc3_,val:_loc7_});
         }
         else
         {
            _loc3_.text = _loc7_.label;
            this.lCount = this.lCount + 1;
            _loc5_ = this.getY(_loc7_.value) - _loc3_._height / 2;
            _loc3_._y = _loc5_ + 2;
            this.__labels.push({mc:_loc3_,val:_loc7_.value});
         }
         if(_loc3_.width + 2 > this.__scaleOffset)
         {
         }
         _loc2_ = _loc2_ + 1;
      }
      this.resetBorders();
      this.resetScale(p_min,p_max);
      var _loc9_ = this.clear(true);
      this.dump(_loc9_);
   }
   function getY(val)
   {
      if(val - this.__get__min() == 0)
      {
         return this.__height - 20.5;
      }
      return Math.abs(this.__height - 20 - (val - this.__get__min()) * this.perVal);
   }
   function setSize(width, height)
   {
      this.__height = height;
      this.__width = width;
      this.checkSpace._y = Math.round(this.__height - 20);
      this.perVal = (height - 20) / (this.__get__max() - this.__get__min());
      this.resetScale(this.__get__min(),this.__get__max());
      this.resetBorders();
      var _loc2_ = this.clear(true);
      this.dump(_loc2_);
   }
   function resetBorders()
   {
      this.UISpace.clear();
      this.drawRect(this.UISpace,this.__scaleOffset,0,this.__width - this.__scaleOffset,this.__height - 20,14016740,100);
      this.drawRect(this.UISpace,this.__scaleOffset + 1,1,this.__width - (this.__scaleOffset + 2),this.__height - 22,16777215,100);
      this.linesMask.clear();
      this.drawRect(this.linesMask,this.__scaleOffset,0,this.__width - this.__scaleOffset,this.__height - 20,0,100);
      this.hitSpace.clear();
      this.drawRect(this.hitSpace,this.__scaleOffset,0,this.__width - this.__scaleOffset,this.__height - 20,0,0);
   }
   function dashTo(mc, startx, starty, endx, endy, len, gap)
   {
      var _loc11_ = undefined;
      var _loc8_ = undefined;
      var _loc7_ = undefined;
      var _loc9_ = undefined;
      var _loc2_ = undefined;
      var _loc1_ = undefined;
      _loc11_ = len + gap;
      _loc8_ = endx - startx;
      _loc7_ = endy - starty;
      var _loc10_ = Math.sqrt(_loc8_ * _loc8_ + _loc7_ * _loc7_);
      _loc9_ = Math.floor(Math.abs(_loc10_ / _loc11_));
      var _loc4_ = Math.atan2(_loc7_,_loc8_);
      _loc2_ = startx;
      _loc1_ = starty;
      _loc8_ = Math.cos(_loc4_) * _loc11_;
      _loc7_ = Math.sin(_loc4_) * _loc11_;
      var _loc3_ = 0;
      while(_loc3_ < _loc9_)
      {
         mc.moveTo(_loc2_,_loc1_);
         mc.lineTo(_loc2_ + Math.cos(_loc4_) * len,_loc1_ + Math.sin(_loc4_) * len);
         _loc2_ += _loc8_;
         _loc1_ += _loc7_;
         _loc3_ = _loc3_ + 1;
      }
      mc.moveTo(_loc2_,_loc1_);
      _loc10_ = Math.sqrt((endx - _loc2_) * (endx - _loc2_) + (endy - _loc1_) * (endy - _loc1_));
      if(_loc10_ > len)
      {
         mc.lineTo(_loc2_ + Math.cos(_loc4_) * len,_loc1_ + Math.sin(_loc4_) * len);
      }
      else if(_loc10_ > 0)
      {
         mc.lineTo(_loc2_ + Math.cos(_loc4_) * _loc10_,_loc1_ + Math.sin(_loc4_) * _loc10_);
      }
      mc.moveTo(endx,endy);
   }
}
