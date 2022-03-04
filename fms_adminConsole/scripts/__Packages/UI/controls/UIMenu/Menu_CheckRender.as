class UI.controls.UIMenu.Menu_CheckRender extends UI.core.movieclip
{
   function Menu_CheckRender()
   {
      super();
      this.attachMovie("Label","__label",0);
      this.attachMovie("blackCheck","cMC",1);
      this.cMC._x = 1;
      this.__label._x = 10;
   }
   function set text(t)
   {
      this.__label.text = t;
   }
   function get text()
   {
      return this.__label.text;
   }
   function set selected(s)
   {
      this.cMC._visible = s;
   }
   function get selected()
   {
      return this.cMC._visible;
   }
   function setSize(w, h)
   {
      this.__label.setSize(w - 10,h);
      this.cMC._y = Math.round(h / 2 - this.cMC._height / 2);
   }
}
