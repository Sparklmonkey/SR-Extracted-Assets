class UI.controls.UIList.ExpandRenderDataHolder extends UI.core.events
{
   function ExpandRenderDataHolder()
   {
      super();
      this.createEmptyMovieClip("back",-1);
      this.__count = 0;
      this.__children = new Array();
      this.format = new TextFormat();
      this.format.font = "verdana";
      this.format.size = 10;
      this.format.bold = true;
   }
   function addItem(label1, label2)
   {
      var _loc2_ = this.createLabel(label1);
      var _loc4_ = this.createLabel(label2);
      this.__children.push({t1:_loc2_,t2:_loc4_});
      if(!this.longestChar)
      {
         this.longestChar = _loc2_;
      }
      if(label1.length > this.longestChar.text.length)
      {
         this.longestChar = _loc2_;
      }
      this.redraw();
   }
   function set width(w)
   {
      this.__width = w;
      this.redraw();
   }
   function createLabel(label)
   {
      this.createTextField("txt" + this.__count,this.__count,0,0,0,0);
      var _loc2_ = this["txt" + this.__count];
      this.__count = this.__count + 1;
      _loc2_.setNewTextFormat(this.format);
      _loc2_.text = label;
      _loc2_.autoSize = true;
      _loc2_.selectable = false;
      return _loc2_;
   }
   function redraw()
   {
      this.back.clear();
      this.drawRect(this.back,0,0,this.__width,this.__children.length * 18,15595519,100);
      var _loc3_ = 0;
      while(_loc3_ < this.__children.length)
      {
         var _loc2_ = this.__children[_loc3_];
         var _loc4_ = _loc3_ * 16 + 1;
         _loc2_.t1._y = _loc2_.t2._y = _loc4_;
         _loc2_.t1._x = 15;
         _loc2_.t2._x = 20 + this.longestChar.textWidth;
         _loc3_ = _loc3_ + 1;
      }
   }
}
