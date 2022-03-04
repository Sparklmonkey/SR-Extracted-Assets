class UI.controls.Tree extends UI.core.events
{
   var __background = 16777215;
   var __border = 8625087;
   var _xoffset = 0;
   var _yoffset = 0;
   var __render = "Tree_DefaultRender";
   var overHead = 50;
   function Tree()
   {
      super();
      this.canScroll = true;
      this.ignoreRedraw = false;
      this.focusRect = true;
      this.ohCount = 0;
      this.offset = 0;
      this.yoffset = 0;
      this.pRender = new Object();
      this.__maxWidth = 0;
      this.pRender["0"] = 2;
      this.createEmptyMovieClip("UISpace",0);
      this.createEmptyMovieClip("rowHolder",1);
      this.createEmptyMovieClip("rowMask",2);
      this.rowHolder.setMask(this.rowMask);
      this.attachMovie("ScrollBar","vScroll",3);
      this.attachMovie("ScrollBar","hScroll",4);
      this.vScroll._y = 2;
      this.hScroll._x = 2;
      this.hScroll.direction = "Horizontal";
      this.hScroll.addListener("scroll",this.doHScroll,this);
      this.vScroll.addListener("scroll",this.doVScroll,this);
      this.__children = new Array();
      this.__count = 0;
      this.rowHolder._x = 6;
      this.__nodeState = new Object();
      var owner = this;
      this.mWheelListner = new Object();
      this.mWheelListner.onMouseWheel = function(delta)
      {
         owner.vPosition -= delta * 2;
      };
   }
   function onSetFocus()
   {
      Mouse.addListener(this.mWheelListner);
   }
   function onKillFocus()
   {
      Mouse.removeListener(this.mWheelListner);
   }
   function doHScroll()
   {
      this.rowHolder._x = 6 + (- this.hScroll.scrollPosition);
   }
   function doVScroll()
   {
      this.rowHolder._y = - this.vScroll.scrollPosition;
   }
   function onKeyDown()
   {
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
      if(Key.isDown(40))
      {
         var _loc3_ = this.__get__selectedItem();
         if(_loc3_.isBranch == true && _loc3_.isOpen == true)
         {
            this.select(_loc3_.getTreeNodeAt(0));
         }
         else
         {
            var _loc2_ = this.traceDown(_loc3_);
            if(_loc2_)
            {
               this.select(_loc2_,true);
            }
         }
      }
      else if(Key.isDown(38))
      {
         _loc3_ = this.__get__selectedItem();
         var _loc4_ = _loc3_.parent.getTreeNodeAt(_loc3_.id - 1);
         _loc2_ = this.traceUp(_loc4_);
         if(_loc2_ == undefined)
         {
            _loc2_ = _loc3_.parent;
         }
         if(_loc2_)
         {
            this.select(_loc2_,true);
         }
      }
      else if(Key.isDown(13))
      {
         _loc3_ = this.__get__selectedItem();
         _loc3_.isOpen = !_loc3_.isOpen;
         this._checkScroll();
      }
   }
   function traceDown(mc)
   {
      var _loc2_ = mc.parent;
      if(_loc2_.length - 1 == mc.id)
      {
         return this.traceDown(_loc2_);
      }
      return _loc2_.getTreeNodeAt(mc.id + 1);
   }
   function traceUp(mc)
   {
      var _loc4_ = mc.parent;
      if(mc.isBranch == true && mc.isOpen == true)
      {
         var _loc3_ = mc.getTreeNodeAt(mc.length - 1);
         return this.traceUp(_loc3_);
      }
      return mc;
   }
   function addTreeNodeAt(index, data, rd)
   {
      var _loc4_ = this.rowHolder.attachMovie("treeNode","node" + this.__count,this.__count);
      if(rd == false)
      {
         this.ignoreRedraw = true;
      }
      var _loc9_ = data.render;
      if(!data.render)
      {
         _loc9_ = this.__render;
      }
      _loc4_.createRender(_loc9_);
      _loc4_.owner = this;
      _loc4_.levels = 0;
      _loc4_.rootTree = this;
      _loc4_.id = index;
      this.__count = this.__count + 1;
      for(var _loc2_ in data)
      {
         _loc4_[_loc2_] = data[_loc2_];
      }
      this.__children.splice(index,0,_loc4_);
      _loc4_.setWidth(this.__maxWidth);
      var _loc8_ = _loc4_.maxHead;
      var _loc6_ = new Object();
      _loc2_ = index;
      while(_loc2_ < this.__children.length)
      {
         _loc6_[_loc2_] = this.pRender[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
      var _loc3_ = index;
      while(_loc3_ < this.__children.length)
      {
         this.pRender[_loc2_ + 1] = _loc6_[_loc2_] + _loc8_;
         _loc3_ = _loc3_ + 1;
      }
      this.setHeight(index,_loc4_.maxHead);
      if(rd != false)
      {
         this.redraw(index);
         this.onChangeWidth();
      }
      this.ignoreRedraw = false;
      return _loc4_;
   }
   function getTreeNodeAt(index)
   {
      return this.__children[index];
   }
   function removeTreeNodeAt(index, rd)
   {
      this.__children[index].removeMovieClip();
      this.__children.splice(index,1);
      if(rd != false)
      {
         this.redraw();
      }
      this.onChangeWidth(this,this.__width);
   }
   function removeAll()
   {
      this.__selectedNode = null;
      var _loc3_ = this.__children.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         this.__children[_loc2_].removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.rowHolder._y = 0;
      this.pRender = new Object();
      this.__maxWidth = this.__width;
      this.pRender["0"] = 2;
      this.__children = new Array();
      this.onChangeWidth(this,this.__width);
   }
   function get length()
   {
      return this.__children.length;
   }
   function get width()
   {
      return this.__width;
   }
   function get height()
   {
      return this.__height;
   }
   function get selectedItem()
   {
      return this.__selectedNode;
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
   function get bottomY()
   {
      var _loc2_ = this.getY(this.__children.length - 1) + this.getHeight(this.__children.length - 1);
      return _loc2_;
   }
   function selectItemAt(i)
   {
      var _loc2_ = this.__children[i];
      this.select(_loc2_);
   }
   function selectFirstItem(matchProp, matchVal, cb, mv2)
   {
      if(!matchProp)
      {
         var _loc10_ = this.__children[0];
         this.select(_loc10_);
         return _loc10_;
      }
      var _loc4_ = 0;
      for(; _loc4_ < this.__children.length; _loc4_ = _loc4_ + 1)
      {
         var _loc3_ = this.__children[_loc4_];
         if(_loc3_[matchProp] != matchVal)
         {
            var _loc2_ = this.workChildren(_loc3_);
            if(_loc2_ != false)
            {
               if(!cb)
               {
                  this.select(_loc2_);
                  this.fullOpen(_loc2_);
               }
               _loc6_ = cb(_loc2_,matchVal,mv2);
               if(_loc6_ == true)
               {
                  this.select(_loc2_);
                  this.fullOpen(_loc2_);
                  return true;
               }
            }
            continue;
         }
         if(!cb)
         {
            this.select(_loc3_);
            return true;
         }
         var _loc6_ = cb(_loc3_,matchVal,mv2);
         if(_loc6_ == true)
         {
            this.select(_loc3_);
            return true;
         }
         continue;
         continue;
         return true;
      }
      return false;
   }
   function workChildren(mc, matchProp, matchVal)
   {
      var _loc3_ = 0;
      while(_loc3_ < mc.length)
      {
         var _loc2_ = mc.getTreeNodeAt(_loc3_);
         if(_loc2_[matchProp] == matchVal)
         {
            return _loc2_;
         }
         if(_loc2_.length > 0)
         {
            var _loc4_ = this.workChildren(_loc2_,matchProp,matchVal);
            if(_loc4_ != false)
            {
               return _loc4_;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      return false;
   }
   function fullOpen(mc)
   {
      var _loc2_ = mc.level;
      while(_loc2_ != 0)
      {
         mc = mc.owner;
         mc.isOpen = true;
         _loc2_ = _loc2_ - 1;
      }
   }
   function select(row, key)
   {
      if(!row.__hilight)
      {
         return false;
      }
      this.__selectedNode.__hilight._alpha = 0;
      this.__selectedNode.__hilight.gotoAndStop(1);
      this.__selectedNode = row;
      row.__hilight._alpha = 100;
      row.__hilight.gotoAndStop(2);
      var _loc3_ = row.trueY - 2;
      var _loc5_ = Math.abs(this.rowHolder._y);
      if(_loc3_ < _loc5_)
      {
         this.__set__vPosition(_loc3_);
      }
      var _loc4_ = row.maxHead;
      var _loc6_ = _loc3_ + _loc4_ + row.maxHead;
      if(_loc6_ > _loc5_ + this.__height + this.yoffset)
      {
         this.__set__vPosition(_loc3_ - (this.__height - _loc4_) + 4 + this.yoffset);
      }
      this.dispatchEvent("change",{target:this,node:row,key:key});
   }
   function setHeight(i, h)
   {
      if(this.pRender[i + 1])
      {
         var _loc4_ = h - this.getHeight(i);
         var _loc2_ = i;
         while(_loc2_ < this.__children.length)
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
   function redraw(from, rs)
   {
      this._relocate(from);
      if(rs == true)
      {
         this.onChangeWidth(this,this.__width);
      }
   }
   function addTreeNode(data, rd)
   {
      if(rd == false)
      {
         this.ignoreRedraw = true;
      }
      var _loc2_ = this.rowHolder.attachMovie("treeNode","node" + this.__count,this.__count);
      var _loc5_ = data.render;
      if(!data.render)
      {
         _loc5_ = this.__render;
      }
      _loc2_.createRender(_loc5_);
      _loc2_.owner = this;
      _loc2_.levels = 0;
      _loc2_.rootTree = this;
      this.__count = this.__count + 1;
      for(var _loc4_ in data)
      {
         _loc2_[_loc4_] = data[_loc4_];
      }
      this.__children.push(_loc2_);
      _loc2_.setWidth(this.__maxWidth);
      this.setHeight(this.__children.length - 1,_loc2_.maxHead);
      if(rd != false)
      {
         this.redraw(this.__children.length - 1);
         this.onChangeWidth();
      }
      this.ignoreRedraw = false;
      return _loc2_;
   }
   function _resize(from, w)
   {
      var _loc2_ = from;
      while(_loc2_ < this.__children.length)
      {
         var _loc3_ = this.__children[_loc2_];
         _loc3_.id = _loc2_;
         var _loc4_ = this.getHeight(_loc2_);
         this.sizeRow(_loc3_,w);
         _loc2_ = _loc2_ + 1;
      }
   }
   function sizeRow(mc, w, h)
   {
      mc.setWidth(w);
      if(mc.hl._visible == true)
      {
         mc.hl._width = w + 1;
         mc.hl._height = h;
      }
   }
   function _relocate(from)
   {
      var _loc2_ = from;
      while(_loc2_ < this.__children.length)
      {
         var _loc3_ = this.__children[_loc2_];
         var _loc5_ = this.pRender[_loc2_];
         var _loc4_ = this.getY(_loc2_);
         _loc3_._y = _loc4_;
         _loc3_.id = _loc2_;
         _loc3_.trueY = _loc4_;
         _loc3_.setTrueY();
         _loc2_ = _loc2_ + 1;
      }
      this._checkScroll();
   }
   function _checkScroll()
   {
      var _loc3_ = this.getY(this.__children.length - 1) + this.getHeight(this.__children.length - 1);
      if(_loc3_ > this.__height && this.canScroll != false)
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
      if(this.__maxWidth > this.__width - this.offset && this.canScroll != false && this.fromWidth != true)
      {
         this.hScroll._visible = true;
         this.yoffset = 14;
         this.hScroll._y = this.__height - 15;
      }
      else
      {
         this.hScroll._visible = false;
         this.yoffset = 0;
         this.rowHolder._x = 6;
      }
      if(this.vScroll._visible == true)
      {
         this.vScroll.setSize(this.__height - 4);
         var _loc2_ = _loc3_ + this.yoffset + 2;
         this.vScroll.setScrollProperties(_loc2_,0,_loc2_ - this.__height);
      }
      if(this.hScroll._visible == true)
      {
         this.hScroll.setSize(this.__width - 4 - this.offset);
         _loc2_ = this.__maxWidth;
         this.hScroll.setScrollProperties(_loc2_,0,_loc2_ - this.__width);
      }
      this.rowMask.clear();
      this.drawRect(this.rowMask,2,2,this.__width - (4 + this.offset),this.__height - (4 + this.yoffset),0,100);
   }
   function onChangeWidth(mc)
   {
      if(mc != this)
      {
         mc.width = mc.getWidth();
      }
      if(this.ignoreRedraw != true)
      {
         var _loc3_ = this.__width;
         this.fromWidth = true;
         var _loc2_ = 0;
         while(_loc2_ < this.__children.length)
         {
            if(this.__children[_loc2_].width > _loc3_)
            {
               _loc3_ = this.__children[_loc2_].width;
               this.fromWidth = false;
            }
            _loc2_ = _loc2_ + 1;
         }
         this.__maxWidth = _loc3_;
         this._resize(0,_loc3_);
         this._checkScroll();
      }
   }
   function onChangeHeight(mc)
   {
      var _loc3_ = mc.getHeight();
      if(this.ignoreRedraw != true)
      {
         this.sizeRow(mc,this.__maxWidth,_loc3_);
         this.setHeight(mc.id,_loc3_);
         this._relocate(mc.id);
      }
   }
   function restoreExpandState()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.__children.length)
      {
         if(this.__nodeState[this.__children[_loc2_].nodeid] != undefined)
         {
            this.__children[_loc2_].isOpen = this.__nodeState[this.__children[_loc2_].nodeid];
         }
         var _loc4_ = 0;
         while(_loc4_ < this.__children[_loc2_].length)
         {
            var _loc3_ = this.__children[_loc2_].getTreeNodeAt(_loc4_);
            if(this.__nodeState[_loc3_.nodeid] != undefined)
            {
               _loc3_.isOpen = this.__nodeState[_loc3_.nodeid];
            }
            _loc4_ = _loc4_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function onExpander(node)
   {
      this.__nodeState[node.nodeid] = node.isOpen;
      this.dispatchEvent("onExpand",{target:this,node:node});
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
   function setSize(w, h)
   {
      this.__width = w;
      this.__height = h;
      this.onChangeWidth(this,w);
      this._checkScroll();
      this.UISpace.clear();
      this.drawRect(this.UISpace,0,0,w,h,this.__border,100);
      this.drawRect(this.UISpace,1,1,w - 2,h - 2,this.__background,100);
   }
}
