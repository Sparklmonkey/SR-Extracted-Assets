class UI.controls.UIList.userListRender extends UI.core.events
{
   function userListRender()
   {
      super();
      this.createTextField("label_txt",0,0,0,50,50);
      this.createEmptyMovieClip("hitSpace",2);
      this.label_txt.autoSize = true;
      this.label_txt.selectable = false;
      this.label_txt.owner = this;
      var _loc3_ = new TextFormat();
      _loc3_.font = "verdana";
      _loc3_.size = 10;
      this.label_txt.setNewTextFormat(_loc3_);
   }
   function set label(l)
   {
      this.label_txt.text = l;
   }
   function get label()
   {
      return this.label_txt.text;
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
      return this.List.__rowHeight;
   }
   function getWidth()
   {
      return this.label_txt._x + this.label_txt._width;
   }
   function setSize(width, height)
   {
      if(this.iconSpace)
      {
         this.iconSpace._x = 15 - this.iconSpace._width / 2;
         this.label_txt._x = 30;
      }
      else
      {
         this.label_txt._x = 0;
      }
      this.label_txt._width = width - this.iconSpace._width;
      this.label_txt._height = height;
      this.label_txt._y = height / 2 - this.label_txt._height / 2;
      this.iconSpace._y = height / 2 - this.iconSpace._height / 2;
      this.hitSpace.clear();
      this.drawRect(this.hitSpace,0,0,width,height,16777215,0);
      this.__width = width;
      this.__height = height;
   }
}
