class UI.controls.DataGrid extends UI.core.events
{
   var defaultRender = "DataGrid_DefaultRender";
   var focusRect = true;
   var icase = true;
   function DataGrid()
   {
      super();
      this.vLines = true;
      this.attachMovie("List","list",0);
      this.attachMovie("DataGrid_Header","head",2);
      this.linesHolder = this.list.lineSpace;
      this.createEmptyMovieClip("sizeHolder",3);
      if(!_root.datagrid_dragger)
      {
         _root.attachMovie("DataGrid_Dragger","datagrid_dragger",-50);
         _root.datagrid_dragger._visible = false;
      }
      this.renders = new Object();
      this.list._y = 15;
      this.list.render = "DataGrid_ListRender";
      this.list.blockFocus();
      this.list.forwardEvent = this;
   }
   function onKeyDown()
   {
      this.list.onKeyDown();
      this.dispatchEvent("onKeyDown",{target:this});
   }
   function setScrollSelection(state)
   {
      this.list.setScrollSelection(state);
   }
   function setTooltip(id, tip)
   {
      this.head.setTooltip(id,tip);
   }
   function setColumnWidth(id, w)
   {
      this.head.getLabelData(id).width = w;
      this.head.redraw();
   }
   function set multipleSelection(b)
   {
      this.list.multipleSelection = b;
   }
   function get selectedIndex()
   {
      return this.list.selectedIndex;
   }
   function get lastSelectedIndex()
   {
      return this.list.lastSelectedIndex;
   }
   function set selectedIndex(i)
   {
      this.list.selectedIndex = i;
   }
   function addColumn(id, label, width, tip, oh)
   {
      var _loc2_ = this.head.createChild(id,label,width,oh);
      this.renders[id] = this.defaultRender;
      if(tip != undefined)
      {
         this.setTooltip(id,tip);
      }
      return _loc2_;
   }
   function addItem(data, rd)
   {
      return this.list.addItem(data,rd);
   }
   function get selectedItems()
   {
      return this.list.selectedItems;
   }
   function set setterEvent(b)
   {
      this.list.setterEvent = b;
   }
   function addItemAt(i, data, rd)
   {
      return this.list.addItemAt(i,data,rd);
   }
   function getItemAt(i)
   {
      return this.list.getItemAt(i);
   }
   function get length()
   {
      return this.list.length;
   }
   function set rowColors(c)
   {
      this.list.rowColors = c;
   }
   function removeItemAt(i)
   {
      this.list.removeItemAt(i);
   }
   function removeAll()
   {
      this.list.removeAll();
   }
   function get selectedItem()
   {
      return this.list.selectedItem;
   }
   function setRender(id, r)
   {
      this.renders[id] = r;
      var _loc2_ = 0;
      while(_loc2_ < this.list.length)
      {
         this.list.getItemAt(_loc2_).setRender(id);
         _loc2_ = _loc2_ + 1;
      }
   }
   function set hLines(b)
   {
      this.list.hLines = b;
   }
   function onSetFocus()
   {
      this.list.onSetFocus();
   }
   function onKillFocus()
   {
      this.list.onKillFocus();
   }
   function sizeCells(data)
   {
      this.cellData = data;
      this.linesHolder.clear();
      if(this.vLines == true)
      {
         for(var _loc5_ in data)
         {
            if(data[_loc5_].visible != false)
            {
               var _loc4_ = data[_loc5_].x + data[_loc5_].width - 1;
               this.drawRect(this.linesHolder,_loc4_,0,1,this.__height - 16,15000804,100);
            }
         }
      }
      var _loc2_ = 0;
      while(_loc2_ < this.list.length)
      {
         this.list.getItemAt(_loc2_).redraw();
         _loc2_ = _loc2_ + 1;
      }
   }
   function getCellRender(id)
   {
      return this.renders[id];
   }
   function getCellData(id)
   {
      return this.cellData[id];
   }
   function doSort(id, mode)
   {
      var _loc5_ = this.list.__data;
      var _loc10_ = new Array();
      var _loc4_ = new Array();
      var _loc2_ = 0;
      while(_loc2_ < _loc5_.length)
      {
         var _loc6_ = _loc5_[_loc2_].mc;
         _loc4_.push({val:_loc6_[id],id:_loc2_});
         _loc2_ = _loc2_ + 1;
      }
      if(this.icase)
      {
         var _loc14_ = function(a, b)
         {
            var _loc2_ = a.val;
            var _loc1_ = b.val;
            _loc2_ = typeof _loc2_ != "string" ? _loc2_ : _loc2_.toLowerCase();
            _loc1_ = typeof _loc1_ != "string" ? _loc1_ : _loc1_.toLowerCase();
            return _loc1_ < _loc2_;
         };
         var _loc11_ = function(a, b)
         {
            var _loc2_ = a.val;
            var _loc1_ = b.val;
            _loc2_ = typeof _loc2_ != "string" ? _loc2_ : _loc2_.toLowerCase();
            _loc1_ = typeof _loc1_ != "string" ? _loc1_ : _loc1_.toLowerCase();
            return _loc2_ < _loc1_;
         };
         _loc4_.sort(mode != 0 ? _loc11_ : _loc14_);
      }
      else
      {
         _loc4_.sortOn("val",mode != 0 ? Array.DESCENDING : Array.ASCENDING);
      }
      var _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         var _loc7_ = _loc4_[_loc3_].id;
         _loc10_.push(_loc5_[_loc7_]);
         _loc3_ = _loc3_ + 1;
      }
      false;
      false;
      this.list.__data = _loc10_;
      this.list.redraw(0);
   }
   function get vPosition()
   {
      return this.list.vPosition;
   }
   function get hPosition()
   {
      return this.list.hPosition;
   }
   function set vPosition(p)
   {
      this.list.vPosition = p;
   }
   function set hPosition(p)
   {
      this.list.hPosition = p;
   }
   function get maxVPosition()
   {
      return this.list.maxVPosition;
   }
   function get maxHPosition()
   {
      return this.list.maxHPosition;
   }
   function redrawHead()
   {
      this.head.redraw();
   }
   function drawBlackLine(x)
   {
      this.sizeHolder.clear();
      this.drawRect(this.sizeHolder,x - 1,1,1,this.__height - 2,0,100);
   }
   function get width()
   {
      return this.__width;
   }
   function get height()
   {
      return this.__height;
   }
   function redraw(i)
   {
      this.list.redraw(i);
   }
   function setSize(w, h)
   {
      this.__height = h;
      this.__width = w;
      this.head.setSize(w);
      this.list.setSize(w,h - 15);
      this.sizeCells(this.cellData);
   }
}
