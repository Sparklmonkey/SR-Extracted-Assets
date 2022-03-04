class admin.general.NumericNavigator extends UI.core.events
{
   var spacer = 3;
   function NumericNavigator()
   {
      super();
      this.createEmptyMovieClip("labelHolder",0);
      this.createEmptyMovieClip("labelMask",1);
      this.attachMovie("Label","rScroll",2);
      this.attachMovie("Label","lScroll",3);
      this.lScroll.autoSize = "left";
      this.lScroll.text = "<";
      this.lScroll.setFormat("color",510);
      this.lScroll.setFormat("underline",true);
      this.lScroll.link = true;
      this.lScroll.addListener("click",this.navClick,this);
      this.rScroll.autoSize = "left";
      this.rScroll.text = ">";
      this.rScroll.setFormat("color",510);
      this.rScroll.setFormat("underline",true);
      this.rScroll.link = true;
      this.rScroll.addListener("click",this.navClick,this);
      this.lScroll._visible = this.rScroll._visible = false;
      this.count = 0;
      this.children = new Array();
      this.blockFocus();
      this.labelHolder.setMask(this.labelMask);
   }
   function navClick(data)
   {
      if(data.target == this.rScroll)
      {
         this.__set__selectedIndex(this.__get__selectedIndex() + 1);
      }
      else
      {
         this.__set__selectedIndex(this.__get__selectedIndex() - 1);
      }
   }
   function clear()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.children.length)
      {
         this.children[_loc2_].mc.removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.lastRed = null;
      this.__selected = null;
      this.children = new Array();
      this.redraw();
      this.setSize(this.__width);
   }
   function addItem(label)
   {
      this.lastRed.setFormat("color",510);
      this.lastRed.setFormat("underline",true);
      var _loc2_ = this.labelHolder.attachMovie("Label","l" + this.count,this.count);
      this.count = this.count + 1;
      _loc2_.text = label;
      _loc2_.autoSize = "left";
      _loc2_.setFormat("color",16724736);
      _loc2_.setFormat("underline",true);
      _loc2_.link = true;
      _loc2_.addListener("click",this.onClick,this);
      this.lastRed = _loc2_;
      this.children.push({mc:_loc2_});
      this.redraw();
      this.relocate();
   }
   function onClick(data)
   {
      this.__set__selectedIndex(data.target.index);
   }
   function getItemAt(i)
   {
      return this.children[i].mc;
   }
   function removeItemAt(i)
   {
      this.children[i].mc.removeMovieClip();
      this.children.splice(i,1);
      this.redraw();
   }
   function relocate()
   {
      this.labelMask.clear();
      this.labelHolder._x = 0;
      this.drawRect(this.labelMask,0,0,this.__width,20,0,100);
      this.lScroll._visible = this.rScroll._visible = false;
      this.rScroll._x = 0;
      var _loc2_ = this.children[this.children.length - 1];
      if(this.labelHolder._width > this.__width)
      {
         this.lScroll._visible = this.__get__selectedIndex() > 0;
         this.rScroll._visible = this.__get__selectedIndex() < this.children.length - 1;
         this.rScroll._x = this.__width - 10;
         this.labelMask.clear();
         this.drawRect(this.labelMask,12,0,this.__width - 24,20,0,100);
         if(this.__selected._x + this.__selected.width > this.__width)
         {
            this.labelHolder._x = 12 + (- this.__selected._x + (this.__width - 24 - this.__selected.width));
         }
         else
         {
            this.labelHolder._x = 12;
         }
      }
   }
   function get selectedIndex()
   {
      return this.__selected.index;
   }
   function set selectedIndex(i)
   {
      if(i < 0 || i > this.children.length - 1)
      {
         return undefined;
      }
      var _loc2_ = this.children[i];
      this.__selected.setFormat("color",510);
      this.__selected.setFormat("underline",true);
      if(this.lastRed == _loc2_.mc)
      {
         this.lastRed = null;
      }
      _loc2_.mc.setFormat("color",3355443);
      _loc2_.mc.setFormat("underline",false);
      this.__selected = _loc2_.mc;
      this.dispatchEvent("click",{target:this,selectedIndex:i});
      this.relocate();
   }
   function get length()
   {
      return this.children.length;
   }
   function redraw()
   {
      var _loc4_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < this.children.length)
      {
         var _loc3_ = this.children[_loc2_];
         _loc3_.mc._x = _loc4_;
         _loc3_.mc.index = _loc2_;
         _loc4_ += _loc3_.mc.width + this.spacer;
         _loc2_ = _loc2_ + 1;
      }
   }
   function setSize(w)
   {
      this.__width = w;
      this.relocate();
   }
}
