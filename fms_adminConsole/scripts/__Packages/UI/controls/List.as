class UI.controls.List extends UI.core.events
{
   var __rowHeight = 20;
   var __background = 16777215;
   var __border = 8625087;
   var __backgroundAlpha = 100;
   var __borderAlpha = 100;
   var __padding = 3;
   var offset = 0;
   var yofs = 0;
   var hLines = false;
   function List()
   {
      super();
      this.ignoreRedraw = false;
      this.focusRect = true;
      this.setterEvent = false;
      this.multipleSelection = false;
      this.pRender = new Object();
      this.selItems = new Array();
      this.__scrollSelection = false;
      this.__width = 0;
      this.__maxWidth = 0;
      this.pRender["0"] = 2;
      this.createEmptyMovieClip("listBase",0);
      this.createEmptyMovieClip("rowColHold",1);
      this.createEmptyMovieClip("rowHolder",2);
      this.createEmptyMovieClip("rowMask",3);
      this.createEmptyMovieClip("lineSpace",4);
      this.attachMovie("ScrollBar","vScroll",5);
      this.attachMovie("ScrollBar","hScroll",6);
      this.createEmptyMovieClip("hitSpace",7);
      this.createEmptyMovieClip("rowColMask",8);
      this.rowColHold.setMask(this.rowColMask);
      this.rowHolder.setMask(this.rowMask);
      this.vScroll.addListener("scroll",this.doVScroll,this);
      this.hScroll.addListener("scroll",this.doHScroll,this);
      this.vScroll._visible = this.hScroll._visible = false;
      this.vScroll._y = 2;
      this.hScroll.direction = "Horizontal";
      this.hScroll._x = 2;
      this.rowColHold._x = 1;
      this.vScroll.blockFocus();
      this.hScroll.blockFocus();
      this.__render = "defaultListRender";
      this.__data = new Array();
      this.__idInc = 0;
      this.rowMask._x = this.rowMask._y = 1;
      this.__rowCols = [16777215];
      this.__selectedIndex = -1;
      var owner = this;
      this.mWheelListner = new Object();
      this.mWheelListner.onMouseWheel = function(delta)
      {
         owner.vPosition -= delta * 2;
      };
      this.mWheelListner.onMouseMove = function()
      {
         owner.mouseNav();
      };
      Mouse.addListener(this);
      this.listBase.onPress = function()
      {
      };
      this.listBase.useHandCursor = false;
      this.notab(this.listBase);
      this.removeAll();
   }
   function mouseNav()
   {
      if(this.__scrollSelection && this.__mDown == true && this._xmouse <= this.__width - this.offset && this.focusRect == true && this.vScroll.isScrolling != true && this.hScroll.isScrolling != true && !Key.isDown(17))
      {
         if(this.rowHolder._ymouse < this.getY(this.__get__selectedIndex()))
         {
            this.__set__selectedIndex(this.__get__selectedIndex() - 1);
            this.dispatchEvent("change",{target:this});
         }
         else if(this.rowHolder._ymouse > this.getY(this.__get__selectedIndex()) + this.getHeight(this.__get__selectedIndex()))
         {
            this.__set__selectedIndex(this.__get__selectedIndex() + 1);
            this.dispatchEvent("change",{target:this});
         }
      }
   }
   function onMouseDown()
   {
      this.__mDown = true;
   }
   function onMouseUp()
   {
      this.__mDown = false;
   }
   function onKeyDown()
   {
      if(Key.isDown(38))
      {
         var _loc2_ = -1;
         if(this.getItemAt(this.__get__selectedIndex() - 1).type == "spacer")
         {
            _loc2_ = -2;
         }
         this.__set__selectedIndex(this.__get__selectedIndex() + _loc2_);
         this.dispatchEvent("change",{target:this,key:true});
      }
      else if(Key.isDown(40))
      {
         _loc2_ = 1;
         if(this.getItemAt(this.__get__selectedIndex() + 1).type == "spacer")
         {
            _loc2_ = 2;
         }
         this.__set__selectedIndex(this.__get__selectedIndex() + _loc2_);
         this.dispatchEvent("change",{target:this,key:true});
      }
      if(Key.isDown(39))
      {
         this.__set__hPosition(this.__get__hPosition() + 1);
      }
      if(Key.isDown(37))
      {
         this.__set__hPosition(this.__get__hPosition() - 1);
      }
      if(Key.isDown(33))
      {
         this.__set__vPosition(this.__get__vPosition() - 1);
      }
      if(Key.isDown(34))
      {
         this.__set__vPosition(this.__get__vPosition() + 1);
      }
      if(Key.isDown(13))
      {
         this.dispatchEvent("enter",{target:this});
      }
      if(Key.isDown(46))
      {
         this.dispatchEvent("delete",{target:this});
      }
      this.__get__selectedItem().onKeyDown();
   }
   function doVScroll()
   {
      this.rowHolder._y = - this.vScroll.scrollPosition;
      this.rowColHold._y = - this.vScroll.scrollPosition;
   }
   function doHScroll()
   {
      this.rowHolder._x = - this.hScroll.scrollPosition;
   }
   function setScrollSelection(state)
   {
      this.__scrollSelection = state;
   }
   function get width()
   {
      return this.__width;
   }
   function get height()
   {
      return this.__height;
   }
   function get vPosition()
   {
      return this.vScroll.scrollPosition;
   }
   function get hPosition()
   {
      return this.hScroll.scrollPosition;
   }
   function set vPosition(s)
   {
      if(this.vScroll._visible != false)
      {
         this.vScroll.scrollPosition = s;
         this.doVScroll();
      }
   }
   function set hPosition(s)
   {
      if(this.hScroll._visible != false)
      {
         this.hScroll.scrollPosition = s;
         this.doHScroll();
      }
   }
   function get maxVPosition()
   {
      if(this.vScroll._visible == false)
      {
         return 0;
      }
      return this.vScroll.max;
   }
   function get maxHPosition()
   {
      if(this.hScroll._visible == false)
      {
         return 0;
      }
      return this.hScroll.max;
   }
   function set rowColors(c)
   {
      this.__rowCols = c;
      this.redraw(0);
   }
   function set background(b)
   {
      this.__background = b;
      this.setSize(this.__width,this.__height);
   }
   function set border(b)
   {
      this.__border = b;
      this.setSize(this.__width,this.__height);
   }
   function set backgroundAlpha(a)
   {
      this.__backgroundAlpha = a;
      this.setSize(this.__width,this.__height);
   }
   function set borderAlpha(a)
   {
      this.__borderAlpha = a;
      this.setSize(this.__width,this.__height);
   }
   function set render(r)
   {
      this.__render = r;
      var _loc3_ = new Array();
      var _loc2_ = 0;
      while(_loc2_ < this.__data.length)
      {
         _loc3_.push(this.__data[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this.removeAll();
      _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         this.addItem(_loc3_[_loc2_].data);
         _loc2_ = _loc2_ + 1;
      }
      false;
   }
   function get length()
   {
      return this.__data.length;
   }
   function set selectedIndex(i)
   {
      if(i == undefined)
      {
         return undefined;
      }
      if(i > this.__data.length - 1)
      {
         i = this.__data.length - 1;
      }
      if(i < 0)
      {
         i = 0;
      }
      this.__data[this.__selectedIndex].mc.onDeselect();
      var _loc3_ = this.__data[i].mc;
      this.__lastselectedIndex = this.__selectedIndex;
      this.__selectedIndex = i;
      var _loc4_ = this.pRender[i] - 2;
      var _loc6_ = Math.abs(this.rowHolder._y);
      if(_loc4_ < _loc6_)
      {
         this.__set__vPosition(_loc4_);
      }
      var _loc5_ = _loc3_.getBestHeight();
      var _loc7_ = this.pRender[i] + _loc5_ + this.yofs;
      if(_loc7_ > _loc6_ + this.__height)
      {
         this.__set__vPosition(_loc4_ - (this.__height - _loc5_) + 4 + this.yofs);
      }
      if(!Key.isDown(17) || this.multipleSelection == false)
      {
         this.deselectAll();
      }
      this.selItems.push(_loc3_);
      this.highlightMC(_loc3_,2);
      if(this.setterEvent == true)
      {
         this.dispatchEvent("change",{target:this,row:_loc3_});
      }
   }
   function get selectedIndex()
   {
      return this.selItems[0].id;
   }
   function get selectedItems()
   {
      return this.selItems;
   }
   function get lastSelectedIndex()
   {
      return this.__lastselectedIndex;
   }
   function get selectedItem()
   {
      if(this.__selectedIndex == -1)
      {
         return null;
      }
      return this.__data[this.__selectedIndex].mc;
   }
   function getItemAt(index)
   {
      return this.__data[index].mc;
   }
   function removeItemAt(index)
   {
      var _loc3_ = this.__data[index];
      _loc3_.mc.removeMovieClip();
      this.__data.splice(index,1);
      this.redraw(index);
      if(this.__selectedIndex == index)
      {
         this.__set__selectedIndex(-1);
      }
      if(this.__selectedIndex > index)
      {
         this.__set__selectedIndex(this.__selectedIndex - 1);
      }
      this.onChangeWidth(this,this.__width);
   }
   function clearSelection()
   {
      this.__selectedIndex = -1;
      this.deselectAll();
   }
   function removeAll()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.__data.length)
      {
         this.__data[_loc2_].mc.removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.rowHolder._y = 0;
      this.__data = new Array();
      this.pRender = new Object();
      this.__maxWidth = this.__width;
      this.pRender["0"] = 2;
      this.__selectedIndex = -1;
      this.onChangeWidth(this,this.__width);
   }
   function addItemAt(index, data, rd)
   {
      var _loc3_ = undefined;
      if(rd == false)
      {
         this.ignoreRedraw = true;
      }
      if(data.type == "spacer")
      {
         _loc3_ = this.rowHolder.attachMovie("List_spacer","row" + this.__idInc,this.__idInc);
      }
      else
      {
         _loc3_ = this.rowHolder.attachMovie(this.__render,"row" + this.__idInc,this.__idInc);
      }
      this.__idInc = this.__idInc + 1;
      _loc3_.id = index;
      _loc3_._x = this.__padding;
      for(var _loc4_ in data)
      {
         _loc3_[_loc4_] = data[_loc4_];
      }
      this.__data.splice(index,0,{mc:_loc3_});
      if(data.type != "spacer")
      {
         this.setupRow(_loc3_,data);
         var _loc6_ = _loc3_.getBestHeight();
         this.insertAt(index,_loc6_);
         _loc3_.setSize(this.__maxWidth,_loc6_,this.__width);
      }
      else
      {
         _loc6_ = 3;
         this.insertAt(index,3);
         _loc3_.setSize(this.__maxWidth,_loc6_,this.__width);
      }
      if(rd != false)
      {
         this.redraw(index);
      }
      this.ignoreRedraw = false;
      return _loc3_;
   }
   function insertAt(i, h)
   {
      var _loc2_ = this.__data.length;
      while(_loc2_ > i)
      {
         this.pRender[_loc2_] = this.pRender[_loc2_ - 1] + h;
         _loc2_ = _loc2_ - 1;
      }
      this.pRender[i + 1] = this.pRender[i] + h;
   }
   function addItem(data, rd)
   {
      var _loc2_ = undefined;
      if(rd == false)
      {
         this.ignoreRedraw = true;
      }
      if(data.type == "spacer")
      {
         _loc2_ = this.rowHolder.attachMovie("List_spacer","row" + this.__idInc,this.__idInc);
      }
      else
      {
         _loc2_ = this.rowHolder.attachMovie(this.__render,"row" + this.__idInc,this.__idInc);
      }
      this.__idInc = this.__idInc + 1;
      _loc2_.id = this.__data.length;
      _loc2_._x = this.__padding;
      this.__data.push({mc:_loc2_});
      if(data.type != "spacer")
      {
         this.setupRow(_loc2_,data);
         var _loc3_ = _loc2_.getBestHeight();
         this.setHeight(this.__data.length - 1,_loc3_);
         _loc2_.setSize(this.__maxWidth,_loc3_,this.__width);
      }
      else
      {
         _loc3_ = 3;
         this.setHeight(this.__data.length - 1,_loc3_);
         _loc2_.setSize(this.__maxWidth,_loc3_,this.__width);
      }
      if(rd != false)
      {
         this.redraw(this.__data.length - 1);
      }
      this.ignoreRedraw = false;
      return _loc2_;
   }
   function setHeight(i, h)
   {
      if(this.pRender[i + 1])
      {
         var _loc4_ = h - this.getHeight(i);
         var _loc2_ = i;
         while(_loc2_ < this.__data.length)
         {
            this.saveHeight(_loc2_,this.getHeight(_loc2_) + _loc4_);
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         this.saveHeight(i,h);
      }
   }
   function saveHeight(i, h)
   {
      this.pRender[i + 1] = this.pRender[i] + h;
   }
   function getHeight(i)
   {
      return this.pRender[i + 1] - this.pRender[i];
   }
   function getY(i)
   {
      return this.pRender[i];
   }
   function getColors(ind)
   {
      return this.__rowCols[ind % this.__rowCols.length];
   }
   function setupRow(mc, data)
   {
      mc.List = this;
      for(var _loc4_ in data)
      {
         mc[_loc4_] = data[_loc4_];
      }
      mc.onData(data);
      mc.attachMovie("List_HighLight","hl",-1);
      mc.hl._visible = false;
      mc.hitSpace.List = this;
      this.notab(mc.hitSpace);
      mc.hitSpace.onPress = function()
      {
         this.List.onSetFocus();
      };
      mc.hitSpace.onPress = function()
      {
         this.List.onClick(this._parent);
      };
      mc.hitSpace.onRollOver = function()
      {
         this.List.RollOver(this._parent);
      };
      mc.hitSpace.onRollOut = function()
      {
         this.List.RollOut(this._parent);
      };
      mc.hitSpace.onReleaseOutside = function()
      {
         this.List.RollOut(this._parent);
      };
      mc.hitSpace.useHandCursor = false;
   }
   function doNav(o)
   {
      o.mouseNav();
   }
   function onSetFocus()
   {
      this.sInt = setInterval(this.doNav,50,this);
      Mouse.addListener(this.mWheelListner);
   }
   function onKillFocus()
   {
      clearInterval(this.sInt);
      Mouse.removeListener(this.mWheelListner);
   }
   function deselectAll()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.__data.length)
      {
         var _loc3_ = this.__data[_loc2_].mc;
         _loc3_.hl._visible = false;
         _loc2_ = _loc2_ + 1;
      }
      this.selItems.splice(0,this.selItems.length);
   }
   function onClick(mc)
   {
      this.__set__selectedIndex(mc.id);
      this.dispatchEvent("change",{target:this,row:mc});
   }
   function RollOver(mc)
   {
      if(!(mc.hl._visible == true && mc.hl._currentframe == 2))
      {
         this.highlightMC(mc,1);
         this.dispatchEvent("rollOver",{target:this,row:mc});
      }
   }
   function RollOut(mc)
   {
      if(!(mc.hl._visible == true && mc.hl._currentframe == 2))
      {
         mc.hl._visible = false;
         this.dispatchEvent("rollOut",{target:this,row:mc});
      }
   }
   function highlightMC(mc, type)
   {
      mc.hl._visible = true;
      mc.hl.gotoAndStop(type);
      var _loc3_ = this.__maxWidth + 2;
      mc.hl._width = _loc3_;
      mc.hl._x = - this.__padding;
      mc.hl._height = this.getHeight(mc.id);
      if(type == 2)
      {
         mc.onSelect();
      }
   }
   function redraw(from)
   {
      this._relocate(from);
   }
   function onChangeWidth(mc, w)
   {
      if(mc != this)
      {
         this.__data[mc.id].width = w;
      }
      if(this.ignoreRedraw != true)
      {
         var _loc3_ = 0;
         var _loc2_ = 0;
         while(_loc2_ < this.__data.length)
         {
            if(this.__data[_loc2_].width > _loc3_)
            {
               _loc3_ = this.__data[_loc2_].width;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(_loc3_ < this.__width)
         {
            _loc3_ = this.__width;
            this.fromWidth = true;
         }
         else
         {
            this.fromWidth = false;
         }
         this.__maxWidth = _loc3_;
         this._resize(0,_loc3_);
         this._checkScroll();
      }
   }
   function onChangeHeight(mc, h)
   {
      this.sizeRow(mc,this.__maxWidth,h);
      if(this.ignoreRedraw != true)
      {
         this.setHeight(mc.id,mc.getBestHeight());
         this._relocate(mc.id);
      }
   }
   function delimFrom(from, delta, delta2)
   {
      var _loc2_ = from;
      while(_loc2_ < this.__data.length)
      {
         this.pRender[_loc2_] += delta;
         _loc2_ = _loc2_ + 1;
      }
   }
   function _drawBackground()
   {
      this.rowColHold.clear();
      if(this.__rowCols.length == 1)
      {
         this.drawRect(this.rowColHold,0,0,this.__width,this.__height,this.__rowCols[0],100);
      }
      else
      {
         var _loc2_ = 0;
         while(_loc2_ < this.__data.length)
         {
            var _loc5_ = this.getHeight(_loc2_);
            this.drawRect(this.rowColHold,0,this.getY(_loc2_),this.__width,_loc5_,this.getColors(_loc2_),100);
            _loc2_ = _loc2_ + 1;
         }
         var _loc9_ = 0;
         if(this.__data.length != 0)
         {
            _loc9_ = this.getY(this.__data.length - 1) + this.getHeight(this.__data.length - 1);
         }
         if(_loc9_ < this.__height)
         {
            var _loc8_ = Math.ceil((this.__height - _loc9_) / this.__rowHeight);
            if(this.__data.length == 0)
            {
               var _loc6_ = 1;
               var _loc7_ = 0;
            }
            else
            {
               _loc6_ = this.__data.length - 1;
               _loc7_ = this.getY(_loc6_) + this.getHeight(_loc6_);
            }
            var _loc3_ = 0;
            while(_loc3_ < _loc8_)
            {
               var _loc4_ = _loc6_ + _loc3_ + 1;
               this.drawRect(this.rowColHold,0,_loc7_ + _loc3_ * this.__rowHeight,this.__width,this.__rowHeight,this.getColors(_loc4_),100);
               _loc3_ = _loc3_ + 1;
            }
         }
      }
   }
   function _resize(from, w)
   {
      var _loc2_ = from;
      while(_loc2_ < this.__data.length)
      {
         var _loc3_ = this.__data[_loc2_];
         _loc3_.mc.id = _loc2_;
         var _loc4_ = this.getHeight(_loc2_);
         this.sizeRow(_loc3_.mc,w,_loc4_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function sizeRow(mc, w, h)
   {
      mc.setSize(w,h,this.__width);
      if(mc.hl._visible == true)
      {
         mc.hl._width = w + 1;
         mc.hl._height = h;
      }
   }
   function _relocate(from)
   {
      var _loc2_ = from;
      while(_loc2_ < this.__data.length)
      {
         var _loc3_ = this.__data[_loc2_];
         var _loc4_ = this.pRender[_loc2_];
         _loc3_.mc._y = this.getY(_loc2_);
         _loc3_.mc.id = _loc2_;
         _loc2_ = _loc2_ + 1;
      }
      this._checkScroll();
      this._drawBackground();
   }
   function _checkScroll()
   {
      var _loc3_ = this.getY(this.__data.length - 1) + this.getHeight(this.__data.length - 1);
      if(_loc3_ > this.__height)
      {
         this.vScroll._visible = true;
         this.vScroll._x = this.__width - (this.vScroll.width + 2);
         this.offset = 14;
      }
      else
      {
         this.vScroll._visible = false;
         this.offset = 0;
         this.rowHolder._y = 0;
      }
      if(this.__maxWidth > this.__width - this.offset && this.fromWidth != true)
      {
         this.hScroll._visible = true;
         this.yofs = 14;
         this.hScroll._y = this.__height - 15;
      }
      else
      {
         this.hScroll._visible = false;
         this.yofs = 0;
         this.rowHolder._x = 0;
      }
      if(this.vScroll._visible == true)
      {
         this.vScroll.setSize(this.__height - 4);
         var _loc2_ = _loc3_ + this.yofs + 2;
         this.vScroll.setScrollProperties(this.__height,0,_loc2_ - this.__height);
      }
      if(this.hScroll._visible == true)
      {
         this.hScroll.setSize(this.__width - 4 - this.offset);
         var _loc4_ = this.offset;
         _loc2_ = this.__maxWidth;
         this.hScroll.setScrollProperties(_loc2_,0,_loc2_ - (this.__width - 14));
      }
      this.rowMask.clear();
      this.drawRect(this.rowMask,1,1,this.__width - this.offset - 4,this.__height - 3 - this.yofs,16777215,100);
   }
   function setSize(w, h)
   {
      if(w > this.__width)
      {
         var _loc4_ = true;
      }
      this.__width = w;
      this.__height = h;
      this.onChangeWidth(this,w);
      this.rowMask.clear();
      this.drawRect(this.rowMask,1,1,w - this.offset - 4,h - 3 - this.yofs,16777215,100);
      this.listBase.clear();
      this.drawRect(this.listBase,0,0,w,h,this.__border,this.__borderAlpha);
      this.drawRect(this.listBase,1,1,w - 2,h - 2,this.__background,this.__backgroundAlpha);
      if(_loc4_ == true)
      {
         this._drawBackground();
      }
      this.rowColMask.clear();
      this.drawRect(this.rowColMask,1,1,w - 2,h - 2,0,0);
      this.__set__selectedIndex(this.__selectedIndex);
   }
}
