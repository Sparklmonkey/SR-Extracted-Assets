class UI.controls.UITree.Tree_DefaultRender extends UI.core.movieclip
{
   function Tree_DefaultRender()
   {
      super();
      this.createEmptyMovieClip("IconSpace",0);
      this.createTextField("label_txt",1,0,0,0,17);
      this.label_txt.autoSize = true;
      this.label_txt.selectable = false;
      this.label_txt.owner = this;
      this.label_txt._y = 1;
      var _loc3_ = new TextFormat();
      _loc3_.font = "Verdana";
      _loc3_.size = 10;
      this.label_txt.setNewTextFormat(_loc3_);
   }
   function firstDraw()
   {
      this.owner.attachValue("label");
      this.owner.attachValue("icon");
   }
   function set label(l)
   {
      this.label_txt.text = l;
      this.label_txt.autoSize = "left";
      this.owner.onChangeWidth();
   }
   function get label()
   {
      return this.label_txt.text;
   }
   function set icon(i)
   {
      this.__icon = i;
      this.IconSpace.removeMovieClip();
      this.attachMovie(i,"IconSpace",2);
      this.IconSpace._x = 2;
      this.IconSpace._y = Math.round(this.getHeight() / 2 - this.IconSpace._height / 2);
      this.label_txt._x = this.IconSpace._width + 3;
   }
   function get icon()
   {
      return this.__icon;
   }
   function getHeight()
   {
      return 20;
   }
   function getWidth()
   {
      return this.label_txt.textWidth + 12;
   }
}
