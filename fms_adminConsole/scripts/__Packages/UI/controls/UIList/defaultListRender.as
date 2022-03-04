class UI.controls.UIList.defaultListRender extends UI.core.movieclip
{
   function defaultListRender()
   {
      super();
      this.createEmptyMovieClip("hitSpace",2);
      this.createTextField("label_txt",0,0,1,100,20);
      this.label_txt.selectable = false;
      var _loc3_ = new TextFormat();
      _loc3_.font = "Verdana";
      _loc3_.size = 10;
      this.label_txt.setNewTextFormat(_loc3_);
   }
   function set label(t)
   {
      this.label_txt.text = t;
      this.List.onChangeWidth(this,this.getWidth());
   }
   function get label()
   {
      return this.label_txt.text;
   }
   function getWidth()
   {
      return this.label_txt.textWidth + 8;
   }
   function getBestHeight()
   {
      return 20;
   }
   function set data(d)
   {
      this.__data = d;
   }
   function get data()
   {
      return this.__data;
   }
   function setSize(width, height)
   {
      this.__width = width;
      this.__height = height;
      this.label_txt._width = width;
      this.label_txt._height = height;
      this.label_txt._y = 2;
      this.hitSpace.clear();
      this.drawRect(this.hitSpace,0,0,width,height,16777215,0);
   }
}
