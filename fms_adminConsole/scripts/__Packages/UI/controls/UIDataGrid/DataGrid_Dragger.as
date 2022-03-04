class UI.controls.UIDataGrid.DataGrid_Dragger extends UI.core.movieclip
{
   function DataGrid_Dragger()
   {
      super();
      this.attachMovie("DataGrid_Over","bgGrad",0);
      this.attachMovie("Label","_label",1);
      this.bgGrad._x = this.bgGrad._y = 2;
      this.bgGrad._height = 12;
      this.bgGrad.gotoAndStop(3);
      this._label._x = 3;
      this._label.setFormat("align","center");
   }
   function set label(s)
   {
      this._label.text = s;
   }
   function setSize(w)
   {
      this.clear();
      this.drawRect(this,0,0,w,16,7372692,100);
      this.drawRect(this,1,1,w - 2,14,13952493,100);
      this._label.setSize(w - 6,17);
      this.bgGrad._width = w - 4;
   }
}
