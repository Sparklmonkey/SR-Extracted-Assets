class UI.controls.UIDataGrid.DataGrid_ListRender extends UI.core.movieclip
{
   function DataGrid_ListRender()
   {
      super();
      this.createEmptyMovieClip("hitSpace",3);
      this.createEmptyMovieClip("lineSpace",4);
      this.children = new Object();
      this.childCount = 0;
      this.datOn = new Object();
      this.hidden = new Object();
      this.drawRect(this.hitSpace,0,0,1,1,0,0);
   }
   function onData(d)
   {
      for(var _loc3_ in d)
      {
         if(!this.children[_loc3_])
         {
            this.datOn[_loc3_] = d[_loc3_];
            this.createChild(_loc3_);
         }
         this.children[_loc3_].setData(d[_loc3_]);
      }
   }
   function onSelect()
   {
      for(var _loc2_ in this.children)
      {
         this.children[_loc2_].onSelect();
      }
   }
   function onDeselect()
   {
      for(var _loc2_ in this.children)
      {
         this.children[_loc2_].onDeselect();
      }
   }
   function setRender(id)
   {
      var _loc3_ = this.children[id].getData();
      this.children[id].removeMovieClip();
      this.createChild(id);
      this.children[id].setData(_loc3_);
   }
   function redraw()
   {
      for(var _loc5_ in this.children)
      {
         this.refreshItem(_loc5_);
      }
      var _loc3_ = new Array();
      for(_loc5_ in this.hidden)
      {
         var _loc4_ = this.List._parent.getCellData(_loc5_);
         if(_loc4_.visible != false)
         {
            this.createChild(_loc5_);
            this.children[_loc5_].setData(this.datOn[_loc5_]);
            _loc3_.push(_loc5_);
         }
      }
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         delete this.hidden[_loc3_[_loc2_]];
         _loc2_ = _loc2_ + 1;
      }
   }
   function getBestHeight()
   {
      var _loc3_ = 0;
      for(var _loc4_ in this.children)
      {
         var _loc2_ = this.children[_loc4_].getBestHeight();
         if(_loc2_ > _loc3_)
         {
            _loc3_ = _loc2_;
         }
      }
      return _loc3_;
   }
   function getWidth()
   {
      return 0;
   }
   function createChild(id)
   {
      var _loc2_ = this.List._parent.getCellData(id);
      if(!_loc2_)
      {
         return undefined;
      }
      if(_loc2_.visible == false)
      {
         var mc = this;
         this.hidden[id] = true;
      }
      else
      {
         var mc = this.attachMovie(this.List._parent.getCellRender(id),"c" + this.childCount,5 + this.childCount);
         this.childCount = this.childCount + 1;
         mc.owner = this;
         this.children[id] = mc;
         this.refreshItem(id);
      }
      var o = this;
      var _loc4_ = function()
      {
         if(mc == o)
         {
            return o.datOn[id];
         }
         return mc.getData();
      };
      var _loc3_ = function(v)
      {
         o.datOn[id] = v;
         mc.setData(v);
      };
      this.addProperty(id,_loc4_,_loc3_);
   }
   function onChangeHeight()
   {
      this.List.onChangeHeight(this,this.getBestHeight());
   }
   function refreshItem(id)
   {
      var _loc2_ = this.children[id];
      var _loc3_ = this.List._parent.getCellData(id);
      if(_loc3_.visible != false)
      {
         if(_loc3_.width != _loc2_.__lastWidth)
         {
            _loc2_.setWidth(_loc3_.width + 6);
            _loc2_.__lastWidth = _loc3_.width;
         }
         _loc2_._x = _loc3_.x - 9;
         _loc2_._visible = true;
      }
      else
      {
         _loc2_._visible = false;
         _loc2_._x = 0;
      }
   }
   function getChild(id)
   {
      return this.children[id];
   }
   function setSize(w, h)
   {
      this.__width = w;
      this.hitSpace._width = w;
      this.hitSpace._height = h;
      this.lineSpace.clear();
      if(this.List.hLines == true)
      {
         this.drawRect(this.lineSpace,-1,h - 1,w + 2,1,14671839,100);
      }
   }
}
