class admin.Panels.Application.DG_render extends UI.core.movieclip
{
   var __mode = 0;
   function DG_render()
   {
      super();
      this.createTextField("label",0,0,1,100,20);
      this.createTextField("inst_label",1,0,1,100,15);
      this.label.selectable = false;
      this.inst_label.selectable = false;
      this.inst_label._height = 16;
      this.f = new TextFormat();
      this.f.font = "Verdana";
      this.f.size = 10;
      this.label.setNewTextFormat(this.f);
      this.f.color = 8816262;
      this.inst_label.setNewTextFormat(this.f);
      this.label._y = 2;
      this.inst_label._y = 17;
      Mouse.addListener(this);
   }
   function onSelect()
   {
      this.f.color = 3355443;
      this.inst_label.setTextFormat(this.f);
      this.inst_label.setNewTextFormat(this.f);
   }
   function onDeselect()
   {
      this.f.color = 8816262;
      this.inst_label.setTextFormat(this.f);
      this.inst_label.setNewTextFormat(this.f);
   }
   function setData(data)
   {
      this.label.text = data.split("/")[0];
      var _loc2_ = data.indexOf("/");
      this.inst_label.text = _loc2_ <= 0 ? "_definst_" : data.substr(_loc2_ + 1);
   }
   function getData()
   {
      return this.label.text + "/" + this.inst_label.text;
   }
   function getBestHeight()
   {
      return 35;
   }
   function setWidth(w)
   {
      this.label._width = w;
      this.inst_label._width = w - 5;
   }
   function onMouseUp()
   {
      if(this.__mode == 1)
      {
         Selection.setFocus(this.inst_label);
      }
   }
   function editMode()
   {
      this.__mode = 1;
      this.inst_label.type = "input";
      this.inst_label.selectable = true;
      this.inst_label.border = true;
      this.inst_label.borderColor = 0;
      this.inst_label.background = true;
      Selection.setFocus(this.inst_label);
   }
   function staticMode()
   {
      this.__mode = 0;
      this.inst_label.type = "dynamic";
      this.inst_label.selectable = false;
      this.inst_label.border = false;
      this.inst_label.background = false;
      Selection.setFocus(null);
   }
}
