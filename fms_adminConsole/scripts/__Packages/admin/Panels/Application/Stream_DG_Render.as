class admin.Panels.Application.Stream_DG_Render extends UI.core.movieclip
{
   function Stream_DG_Render()
   {
      super();
      this.createTextField("label",0,0,1,100,20);
      this.attachMovie("icon_stream","ico",1);
      this.label.selectable = false;
      var _loc3_ = new TextFormat();
      _loc3_.font = "Verdana";
      _loc3_.size = 10;
      this.label.setNewTextFormat(_loc3_);
      this.label._y = 2;
      this.label._x = 13;
      this.ico._y = 4;
   }
   function setData(data)
   {
      this.label.text = data;
   }
   function getData()
   {
      return this.label.text;
   }
   function getBestHeight()
   {
      return 20;
   }
   function setWidth(w)
   {
      this.label._width = w - 13;
      this.label._height = this.getBestHeight();
   }
}
