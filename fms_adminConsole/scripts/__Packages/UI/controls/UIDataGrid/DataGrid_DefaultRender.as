class UI.controls.UIDataGrid.DataGrid_DefaultRender extends MovieClip
{
   function DataGrid_DefaultRender()
   {
      super();
      this.createTextField("label",0,0,1,100,20);
      this.label.selectable = false;
      var _loc3_ = new TextFormat();
      _loc3_.font = "Verdana";
      _loc3_.size = 10;
      this.label.setNewTextFormat(_loc3_);
      this.label._y = 2;
   }
   function setData(data)
   {
      if(data != undefined)
      {
         this.label.text = data;
      }
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
      this.label._width = w;
      this.label._height = this.getBestHeight();
   }
}
