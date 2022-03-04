class UI.controls.UIDataGrid.DataGrid_Header extends UI.core.movieclip
{
   var spacer = 11;
   function DataGrid_Header()
   {
      super();
      this.children = new Array();
      this.mListner = new Object();
      this.byID = new Object();
      this.l_count = 0;
      this.colList = ",";
      this.inDrag = false;
      this.mListner2 = new Object();
      var _loc5_ = this;
      var _loc6_ = "";
      while(_loc5_ != _root)
      {
         _loc6_ += _loc5_._name + "_";
         _loc5_ = _loc5_._parent;
      }
      this.__idStr = _loc6_;
      this.history = _global.l_cache.getProp(_loc6_,new Object());
      if(this.history.orders)
      {
         this.oList = this.history.orders;
      }
      else
      {
         this.oList = "";
      }
      this.createEmptyMovieClip("baseSpace",0);
      this.attachMovie("DataGrid_Over","over",1);
      this.createEmptyMovieClip("labelSpace",2);
      this.attachMovie("DataSortArrow","sArrow",3);
      this.createEmptyMovieClip("positionator",5);
      this.attachMovie("Menu","__menu",9);
      this.createEmptyMovieClip("hideDown",10);
      this.__menu.addListener("click",this.onClick,this);
      this.drawRect(this.positionator,0,0,1,16,0,100);
      this.positionator._visible = false;
      this.over._x = this.over._y = 2;
      this.dragUI._visible = false;
      this.dragUI._y = 1;
      this.sArrow._visible = false;
      this.sArrow._y = 6;
      this.drawRect(this.hideDown,0,0,12,16,7372692,100);
      this.drawRect(this.hideDown,1,1,10,14,13689582,100);
      this.hideDown.attachMovie("DataGrid_Over","over",0);
      this.hideDown.over._x = this.hideDown.over._y = 2;
      this.hideDown.over._width = 8;
      this.hideDown.over._height = 12;
      this.hideDown.attachMovie("DataSortArrow","arrow",1);
      this.hideDown.arrow._x = 3;
      this.hideDown.arrow._y = 6;
      var owner = this;
      this.mListner.onMouseMove = function()
      {
         owner.doSizeMove();
      };
      this.mListner.onMouseUp = function()
      {
         owner.doSizeUp();
      };
      this.mListner2.onMouseMove = function()
      {
         owner.doDragMove();
      };
      this.mListner2.onMouseUp = function()
      {
         owner.doDragUp();
      };
      this.hideDown.onPress = function()
      {
         this.over.gotoAndStop(2);
         owner.onShowMenu();
      };
      this.hideDown.onRelease = this.hideDown.onReleaseOutside = function()
      {
         this.over.gotoAndStop(1);
      };
      this.dragUI.onRelease = this.dragUI.onReleaseOutside = function()
      {
         owner.hideDrag();
      };
      this.dragUI._focusrect = false;
      this.dragUI.tabEnabled = false;
      this.dragUI.useHandCursor = false;
      this.hideDown.useHandCursor = false;
      this.hideDown.tabEnabled = false;
      this.hideDown._focusrect = false;
   }
   function getLabelData(id)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.children.length)
      {
         var _loc3_ = this.children[_loc2_];
         if(_loc3_.id == id)
         {
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setTooltip(id, tip)
   {
      this.addToolTip(tip,this.getLabelData(id).mc);
   }
   function createChild(id, label, width, overhead)
   {
      if(this.history[id])
      {
         width = this.history[id].width;
      }
      else
      {
         this.history[id] = new Object();
         this.history[id].width = width;
         this.history[id].forceNS = false;
         this.firstOrder = true;
      }
      this.colList += id + ",";
      var _loc2_ = this.labelSpace.attachMovie("DataGrid_HB","l" + this.l_count,this.l_count);
      this.l_count = this.l_count + 1;
      width -= this.spacer;
      _loc2_.label = label;
      _loc2_.setWidth(width);
      _loc2_.id = id;
      this.children.push({id:id,mc:_loc2_,width:width,label:label,forceNS:this.history[id].forceNS});
      this.fromOrders(overhead);
      this.redraw();
      return _loc2_;
   }
   function fromOrders(overhead)
   {
      if(this.oList != "")
      {
         var _loc4_ = this.oList.split(",");
         _loc4_.pop();
         if(overhead)
         {
            if(this.children.length != overhead)
            {
               return undefined;
            }
         }
         if(_loc4_.length == this.children.length && this.oList.indexOf("undefined") == -1)
         {
            var _loc5_ = new Object();
            var _loc2_ = 0;
            while(_loc2_ < this.children.length)
            {
               _loc5_[this.children[_loc2_].id] = _loc2_;
               _loc2_ = _loc2_ + 1;
            }
            var _loc6_ = new Array();
            var _loc3_ = 0;
            while(_loc3_ < _loc4_.length)
            {
               _loc6_.push(this.children[_loc5_[_loc4_[_loc3_]]]);
               _loc3_ = _loc3_ + 1;
            }
            if(_loc6_.length == this.children.length)
            {
               this.children = _loc6_;
            }
         }
      }
   }
   function showDrag(mc)
   {
   }
   function beginDrag(mc)
   {
      this.dragUI._x = this._xmouse - 8;
      this.dragUI._visible = true;
      this.inDrag = true;
      this.isDrag = mc;
      Mouse.addListener(this.mListner);
   }
   function hideDrag()
   {
      if(this.inDrag != true)
      {
         this.dragUI._visible = false;
      }
   }
   function doSizeMove()
   {
      var _loc2_ = this._xmouse;
      if(_loc2_ < this.isDrag._x)
      {
         _loc2_ = this.isDrag._x;
      }
      var _loc3_ = this.__width - 1 - this.hideDown._width;
      if(_loc2_ > _loc3_)
      {
         _loc2_ = _loc3_;
      }
      this.children[this.isDrag.index].width = _loc2_ - this.isDrag._x;
      this.history[this.children[this.isDrag.index].id].width = _loc2_ - this.isDrag._x;
      this._parent.drawBlackLine(_loc2_);
      this.dragUI._x = _loc2_ - 9;
      this.redraw();
   }
   function doSizeUp()
   {
      var _loc2_ = this._xmouse;
      if(_loc2_ < this.isDrag._x)
      {
         _loc2_ = this.isDrag._x;
      }
      var _loc3_ = this.__width - 1 - this.hideDown._width;
      if(_loc2_ > _loc3_)
      {
         _loc2_ = _loc3_;
      }
      this.history[this.children[this.isDrag.index].id].width = _loc2_ - this.isDrag._x + this.spacer;
      this.children[this.isDrag.index].width = _loc2_ - this.isDrag._x;
      this._parent.sizeHolder.clear();
      Mouse.removeListener(this.mListner);
      this.dragUI._visible = false;
      this.redraw();
   }
   function redraw()
   {
      var _loc5_ = this.spacer;
      var _loc7_ = new Object();
      this.menuDP = new Array();
      this.byX = new Object();
      this.byID = new Object();
      this.history.orders = "";
      var _loc4_ = 0;
      while(_loc4_ < this.children.length)
      {
         var _loc3_ = this.children[_loc4_];
         if(_loc3_.mc.id != undefined)
         {
            if(_loc3_.width < 14)
            {
               _loc3_.width = 14;
            }
            this.history.orders += _loc3_.mc.id + ",";
            _loc3_.mc.index = _loc4_;
            _loc3_.mc.id = _loc3_.id;
            this.byID[_loc4_] = _loc3_.id;
            var _loc6_ = _loc5_ + _loc3_.width + 11;
            if(_loc6_ > this.__width || _loc3_.forceNS == true)
            {
               _loc7_[_loc3_.id] = {visible:false};
               _loc3_.mc._visible = false;
            }
            else
            {
               _loc7_[_loc3_.id] = {x:_loc5_,width:_loc3_.width};
               _loc3_.mc._x = _loc5_;
               this.byX[_loc5_] = _loc3_;
               _loc3_.mc._visible = true;
               _loc3_.mc.setWidth(_loc3_.width);
               _loc3_.mc._xscale = _loc3_.mc._yscale = 100;
               _loc5_ += _loc3_.width + this.spacer;
            }
            this.menuDP.push({label:_loc3_.mc.label,data:_loc4_,type:"check",selected:!_loc3_.forceNS});
         }
         _loc4_ = _loc4_ + 1;
      }
      this.sArrow._x = this.lastSort._x - 8;
      this.sArrow._visible = this.lastSort._visible;
      _global.l_cache.setProp(this.__idStr,this.history);
      this._parent.sizeCells(_loc7_);
   }
   function doDrag(mc)
   {
      this.isDragClip = mc;
      _root.datagrid_dragger.label = mc.label;
      _root.datagrid_dragger.setSize(mc.bestWidth + 30);
      _root.datagrid_dragger._x = _root._xmouse;
      _root.datagrid_dragger._y = _root._ymouse - 16;
      _root.datagrid_dragger.swapDepths(_root.getNextHighestDepth());
      _root.datagrid_dragger._visible = true;
      Mouse.addListener(this.mListner2);
   }
   function doDragMove()
   {
      this.positionator._visible = true;
      _root.datagrid_dragger._x = _root._xmouse;
      _root.datagrid_dragger._y = _root._ymouse - 16;
      this.positionator._x = this.findSnap(_root._xmouse);
   }
   function findSnap(x)
   {
      var _loc10_ = {x:x,y:0};
      this.globalToLocal(_loc10_);
      x = _loc10_.x;
      if(x <= 0)
      {
         this.lastPos = 0;
         return 0;
      }
      var _loc9_ = this.children[this.children.length - 1];
      _loc9_ = _loc9_.mc._x + _loc9_.width;
      if(x > _loc9_)
      {
         this.lastPos = this.children.length;
         return _loc9_;
      }
      var _loc3_ = 0;
      while(_loc3_ < this.children.length)
      {
         var _loc5_ = this.children[_loc3_];
         if(_loc5_.mc._visible != false)
         {
            var _loc7_ = _loc5_.mc;
            var _loc2_ = _loc7_._x - this.spacer;
            var _loc4_ = _loc5_.width + this.spacer;
            if(x > _loc2_ && x < _loc2_ + _loc4_)
            {
               var _loc8_ = _loc2_ + _loc4_ / 2;
               if(x > _loc8_)
               {
                  this.lastPos = _loc3_ + 1;
                  return _loc2_ + _loc4_;
               }
               this.lastPos = _loc3_;
               return _loc2_;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      this.lastPos = 0;
      return 0;
   }
   function doDragUp()
   {
      Mouse.removeListener(this.mListner2);
      this.positionator._visible = false;
      var _loc3_ = this.isDragClip.index;
      if(_loc3_ < this.lastPos)
      {
         this.lastPos = this.lastPos - 1;
      }
      var _loc4_ = this.children[_loc3_];
      this.children.splice(_loc3_,1);
      var _loc5_ = undefined;
      if(this.lastPos == undefined)
      {
         _loc5_ = this.children.length;
         this.children.push(_loc4_);
      }
      else
      {
         _loc5_ = this.lastPos;
         this.children.splice(this.lastPos,0,_loc4_);
      }
      this.redraw();
      _root.datagrid_dragger._visible = false;
   }
   function doSort(id, mode, mc)
   {
      if(this.lastSort != mc)
      {
         this.lastSort.over.gotoAndStop(1);
         this.lastSort.sortMode = 0;
      }
      this._parent.doSort(id,mode);
      this.sArrow._x = mc._x - 8;
      this.sArrow._visible = true;
      this.sArrow.gotoAndStop(mode + 1);
      this.lastSort = mc;
   }
   function onShowMenu()
   {
      this.__menu.headerLabel = "Columns";
      this.__menu.dataProvider = this.menuDP;
      this.__menu.show(this.__width - this.__menu.width,16);
   }
   function onClick(evt)
   {
      var _loc2_ = this.children[evt.data];
      if(evt.target.selected == true)
      {
         _loc2_.forceNS = false;
      }
      else
      {
         _loc2_.forceNS = true;
      }
      this.history[_loc2_.id].forceNS = _loc2_.forceNS;
      this.redraw();
   }
   function setSize(w)
   {
      this.__width = w;
      this.baseSpace.clear();
      this.drawRect(this.baseSpace,0,0,w,16,7506344,100);
      this.drawRect(this.baseSpace,1,1,w - 2,14,14477807,100);
      this.over._width = w - 4;
      this.hideDown._x = w - 12;
      this.redraw();
   }
}
