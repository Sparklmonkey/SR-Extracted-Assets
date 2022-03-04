class UI.controls.UIList.ExpandRender extends UI.core.events
{
   function ExpandRender()
   {
      super();
      this.createTextField("label_txt",0,0,0,50,50);
      this.attachMovie("ExpandRenderDataHolder","ExpandedDataHolder",1);
      this.createEmptyMovieClip("hitSpace",2);
      this.attachMovie("TreeExpand","expander",3);
      this.notab(this.expander);
      var owner = this;
      this.ExpandedDataHolder._y = 19;
      this.ExpandedDataHolder._visible = false;
      this.label_txt.autoSize = true;
      this.label_txt.selectable = false;
      this.label_txt.owner = this;
      this.expander._y = 6;
      this.expander._x = 2;
      this.expander.onPress = function()
      {
         var _loc2_ = this._currentframe;
         if(_loc2_ == 1)
         {
            this.gotoAndStop(2);
            owner.ExpandedDataHolder._visible = true;
         }
         else
         {
            this.gotoAndStop(1);
            owner.ExpandedDataHolder._visible = false;
         }
         owner.List.onChangeHeight(owner,owner.getBestHeight());
      };
      var _loc3_ = new TextFormat();
      _loc3_.font = "verdana";
      _loc3_.size = 10;
      this.label_txt._y = 1;
      this.label_txt.setNewTextFormat(_loc3_);
   }
   function onKeyDown()
   {
      if(Key.isDown(13))
      {
         var _loc2_ = this.expander._currentframe;
         if(_loc2_ == 1)
         {
            this.expander.gotoAndStop(2);
            this.ExpandedDataHolder._visible = true;
         }
         else
         {
            this.expander.gotoAndStop(1);
            this.ExpandedDataHolder._visible = false;
         }
         this.hl._height = this.getBestHeight();
         this.List.onChangeHeight(this,this.getBestHeight());
      }
   }
   function set label(l)
   {
      this.label_txt.text = l;
   }
   function get label()
   {
      return this.label_txt.text;
   }
   function set data(data)
   {
      var _loc2_ = 0;
      while(_loc2_ < data.length)
      {
         var _loc3_ = data[_loc2_];
         this.ExpandedDataHolder.addItem(_loc3_.label,_loc3_.data);
         _loc2_ = _loc2_ + 1;
      }
   }
   function set icon(i)
   {
      this.__icon = i;
      this.iconSpace.removeMovieClip();
      this.attachMovie(i,"iconSpace",3);
      this.setSize(this.__width,this.__height);
   }
   function get icon()
   {
      return this.__icon;
   }
   function getBestHeight()
   {
      if(this.ExpandedDataHolder._visible == false)
      {
         return this.List.__rowHeight;
      }
      return this.List.__rowHeight + this.ExpandedDataHolder._height;
   }
   function getWidth()
   {
      return this.label_txt._x + this.label_txt.textWidth;
   }
   function setSize(width, height, trueWidth)
   {
      if(this.iconSpace)
      {
         this.label_txt._x = 14 + this.iconSpace._width + 2;
      }
      else
      {
         this.label_txt._x = 14;
      }
      this.label_txt._width = width - this.iconSpace._width;
      this.label_txt._height = height;
      this.iconSpace._y = height / 2 - this.iconSpace._height / 2;
      this.hitSpace.clear();
      this.drawRect(this.hitSpace,0,0,width,height,16777215,0);
      this.__width = width;
      this.__height = height;
      this.ExpandedDataHolder.width = trueWidth - 6;
   }
}
