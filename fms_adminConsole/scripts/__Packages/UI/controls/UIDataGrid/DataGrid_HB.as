class UI.controls.UIDataGrid.DataGrid_HB extends UI.core.events
{
   function DataGrid_HB()
   {
      super();
      this.createEmptyMovieClip("UIBase",0);
      this.attachMovie("DataGrid_Over","over",1);
      this.createTextField("label_txt",2,0,0,50,16);
      this.createEmptyMovieClip("mask",3);
      this.createEmptyMovieClip("hitSpace",4);
      this.createEmptyMovieClip("dragPart",5);
      this.label_txt.autoSize = true;
      this.label_txt.selectable = false;
      this.label_txt.owner = this;
      var _loc3_ = new TextFormat();
      _loc3_.font = "arial";
      _loc3_.size = 10;
      this.label_txt.setNewTextFormat(_loc3_);
      this.over._y = 2;
      this.over._x = -10;
      this.sortMode = 0;
      var owner = this;
      this.hitSpace.onRollOver = function()
      {
         owner.dispatchEvent("onRollOver",{target:owner});
         if(owner.over._currentframe != 3)
         {
            owner.over.gotoAndStop(2);
         }
      };
      this.hitSpace.onPress = function()
      {
         owner.over.gotoAndStop(3);
      };
      this.hitSpace.onRelease = function()
      {
         owner.doSort();
         owner.over.gotoAndStop(3);
      };
      this.hitSpace.onRollOut = function()
      {
         owner.dispatchEvent("onRollOut",{target:owner});
         if(owner.over._currentframe != 3)
         {
            owner.over.gotoAndStop(1);
         }
      };
      this.hitSpace.onDragOut = function()
      {
         owner.dispatchEvent("onRollOut",{target:owner});
         owner._parent._parent.lastSort.over.gotoAndStop(0);
         owner._parent._parent.sArrow._visible = false;
         owner._parent._parent.lastSort = owner;
         owner._parent._parent.doDrag(owner);
      };
      this.hitSpace._focusrect = false;
      this.hitSpace.tabEnabled = false;
      this.dragPart.onRollOver = function()
      {
         if(owner.over._currentframe != 3)
         {
            owner.over.gotoAndStop(2);
         }
         owner._parent._parent.showDrag(owner);
      };
      this.dragPart.onRollOut = function()
      {
         if(owner.over._currentframe != 3)
         {
            owner.over.gotoAndStop(1);
         }
         owner._parent._parent.hideDrag();
      };
      this.dragPart.onReleaseOutside = function()
      {
         if(owner.over._currentframe != 3)
         {
            owner.over.gotoAndStop(1);
         }
         owner._parent._parent.hideDrag();
      };
      this.dragPart.onRelease = function()
      {
         owner._parent._parent.hideDrag();
      };
      this.dragPart.onPress = function()
      {
         owner._parent._parent.beginDrag(owner);
      };
      this.dragPart._focusrect = false;
      this.dragPart.tabEnabled = false;
      this.hitSpace.useHandCursor = this.dragPart.useHandCursor = false;
      this.setMask(this.mask);
   }
   function doSort()
   {
      if(this.sortMode == 0)
      {
         this.sortMode = 1;
      }
      else
      {
         this.sortMode = 0;
      }
      this.over.gotoAndStop(this.sortMode + 1);
      this._parent._parent.doSort(this.id,this.sortMode,this);
   }
   function set label(l)
   {
      this.label_txt.text = l;
   }
   function get label()
   {
      return this.label_txt.text;
   }
   function get bestWidth()
   {
      return this.label_txt.textWidth;
   }
   function setWidth(w)
   {
      this.label_txt._width = w;
      this.mask.clear();
      this.drawRect(this.mask,-11,0,w + 11,16,0,100);
      this.hitSpace.clear();
      this.drawRect(this.hitSpace,0,0,w + 4,16,0,0);
      this.drawRect(this.hitSpace,w - 1,1,1,14,10066327,100);
      this.dragPart.clear();
      this.drawRect(this.dragPart,w - 6,0,12,16,0,0);
      this.over._width = w + 10;
   }
}
