class UI.controls.UITree.treeNode extends UI.core.events
{
   var __render = "Tree_DefaultRender";
   function treeNode()
   {
      super();
      this.count = 0;
      this.expanded = false;
      this.__children = new Array();
      this.attachMovie("TreeExpand","expander",2);
      this.createEmptyMovieClip("childrenHolder",3);
      this.attachMovie("List_HighLight","__hilight",-1);
      this.__hilight._alpha = 0;
      this.__hilight.owner = this;
      this.__hilight.onRollOver = function()
      {
         if(this._currentframe != 2)
         {
            this._alpha = 100;
            this.gotoAndStop(1);
         }
      };
      this.__hilight.onRollOut = function()
      {
         if(this._currentframe != 2)
         {
            this._alpha = 0;
         }
      };
      this.__hilight.onReleaseOutside = function()
      {
         if(this._currentframe != 2)
         {
            this._alpha = 0;
         }
      };
      this.notab(this.__hilight);
      this.__hilight.onPress = function()
      {
         if(this._currentframe != 2)
         {
            this.owner.rootTree.select(this.owner);
            this._alpha = 100;
            this.gotoAndStop(2);
         }
      };
      this.__hilight.useHandCursor = false;
      this.expander._y = 5;
      this.childrenHolder._x = 16;
      this.childrenHolder._visible = false;
      var local = this;
      this.notab(this.expander);
      this.expander.onPress = function()
      {
         local.onExpander();
      };
      this.refresh();
   }
   function get maxHead()
   {
      return this.renderSpace.getHeight();
   }
   function attachValue(v)
   {
      var _loc2_ = function()
      {
         return this.renderSpace[v];
      };
      var _loc3_ = function(s)
      {
         this.renderSpace[v] = s;
      };
      if(this[v])
      {
         this.renderSpace[v] = this[v];
      }
      this.addProperty(v,_loc2_,_loc3_);
   }
   function createRender(r)
   {
      this.attachMovie(r,"renderSpace",1);
      this.renderSpace.owner = this;
      this.renderSpace.firstDraw();
      this.renderSpace._x = 10;
      this.__hilight._height = this.maxHead;
      this.childrenHolder._y = this.maxHead;
   }
   function set render(r)
   {
      this.__render = r;
      this.createRender(r);
      this.onChangeHeight();
      this.onChangeWidth();
   }
   function set levels(l)
   {
      this.__levels = l;
      this.__hilight._x = - l * 16 - 6;
   }
   function setTrueY()
   {
      var _loc3_ = 0;
      while(_loc3_ < this.__children.length)
      {
         var _loc2_ = this.__children[_loc3_];
         _loc2_.trueY = this.trueY + _loc2_._y + this.__get__maxHead();
         _loc2_.setTrueY();
         _loc3_ = _loc3_ + 1;
      }
   }
   function onExpander()
   {
      if(this.expanded == false)
      {
         this.childrenHolder._visible = true;
         this.expander.gotoAndStop(2);
      }
      else
      {
         this.childrenHolder._visible = false;
         this.expander.gotoAndStop(1);
      }
      this.expanded = !this.expanded;
      this.owner.onChangeHeight(this);
      this.owner.onChangeWidth(this);
      this.rootTree.onExpander(this);
      this.redraw();
   }
   function onChangeHeight()
   {
      this.owner.onChangeHeight(this);
   }
   function expandAll(e)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.__children.length)
      {
         this.__children[_loc2_].isOpen = e;
         this.__children[_loc2_].expandAll(e);
         _loc2_ = _loc2_ + 1;
      }
   }
   function getHeight()
   {
      var _loc3_ = this.__get__maxHead();
      if(this.childrenHolder._visible == true)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.__children.length)
         {
            _loc3_ += this.__children[_loc2_].getHeight();
            _loc2_ = _loc2_ + 1;
         }
      }
      return _loc3_;
   }
   function onChangeWidth()
   {
      this.owner.onChangeWidth(this);
   }
   function getWidth()
   {
      var _loc6_ = this.__levels * 16;
      var _loc5_ = _loc6_ + (this.renderSpace._x + this.renderSpace.getWidth());
      if(this.__get__isOpen() == true && this.__get__isBranch() == true)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.__children.length)
         {
            var _loc4_ = this.__children[_loc2_];
            var _loc3_ = _loc4_.getWidth();
            if(_loc3_ > _loc5_)
            {
               _loc5_ = _loc3_;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      return _loc5_;
   }
   function addTreeNode(data)
   {
      var _loc2_ = this.childrenHolder.attachMovie("treeNode","node" + this.count,this.count);
      var _loc5_ = data.render;
      if(!data.render)
      {
         _loc5_ = this.__render;
      }
      _loc2_.createRender(_loc5_);
      _loc2_.levels = this.__levels + 1;
      _loc2_.owner = this;
      _loc2_.rootTree = this.rootTree;
      this.count = this.count + 1;
      for(var _loc4_ in data)
      {
         _loc2_[_loc4_] = data[_loc4_];
      }
      this.__children.push(_loc2_);
      _loc2_.setWidth(this.__width);
      this.refresh();
      this.redraw();
      return _loc2_;
   }
   function get parent()
   {
      return this.owner;
   }
   function get firstChild()
   {
      return this.__children[0];
   }
   function addTreeNodeAt(index, data)
   {
      var _loc2_ = this.childrenHolder.attachMovie("treeNode","node" + this.count,this.count);
      _loc2_.levels = this.__get__levels() + 1;
      _loc2_.owner = this;
      _loc2_.rootTree = this.rootTree;
      this.count = this.count + 1;
      for(var _loc4_ in data)
      {
         _loc2_[_loc4_] = data[_loc4_];
      }
      this.__children.splice(index,0,_loc2_);
      _loc2_.setWidth(this.__width);
      this.refresh();
      this.redraw();
      return _loc2_;
   }
   function removeAll()
   {
      var _loc3_ = this.__get__length();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         this.removeTreeNodeAt(0);
         _loc2_ = _loc2_ + 1;
      }
   }
   function get isOpen()
   {
      return this.expanded;
   }
   function set isOpen(o)
   {
      if(o == true)
      {
         this.childrenHolder._visible = true;
         this.expander.gotoAndStop(2);
      }
      else
      {
         this.childrenHolder._visible = false;
         this.expander.gotoAndStop(1);
      }
      if(this.expanded != o)
      {
         this.expanded = o;
         this.owner.onChangeHeight(this);
         this.owner.onChangeWidth(this);
         this.rootTree.onExpander(this);
      }
      else
      {
         this.expanded = o;
      }
      this.redraw();
   }
   function get isBranch()
   {
      if(this.__children.length > 0)
      {
         return true;
      }
      return false;
   }
   function get level()
   {
      return this.__levels;
   }
   function removeTreeNodeAt(i)
   {
      this.__children[i].removeMovieClip();
      this.__children.splice(i,1);
      this.refresh();
      this.redraw();
   }
   function getTreeNodeAt(i)
   {
      return this.__children[i];
   }
   function get length()
   {
      return this.__children.length;
   }
   function redraw()
   {
      var _loc4_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < this.__children.length)
      {
         var _loc3_ = this.__children[_loc2_];
         _loc3_._y = _loc4_;
         _loc3_.id = _loc2_;
         _loc4_ += _loc3_.getHeight();
         _loc2_ = _loc2_ + 1;
      }
      this.owner.redraw();
   }
   function refresh()
   {
      if(this.__children.length == 0)
      {
         this.expander._visible = false;
      }
      else
      {
         this.expander._visible = true;
      }
   }
   function setWidth(w)
   {
      this.__width = w;
      this.__hilight._width = w;
      var _loc2_ = 0;
      while(_loc2_ < this.__children.length)
      {
         this.__children[_loc2_].setWidth(w);
         _loc2_ = _loc2_ + 1;
      }
   }
}
