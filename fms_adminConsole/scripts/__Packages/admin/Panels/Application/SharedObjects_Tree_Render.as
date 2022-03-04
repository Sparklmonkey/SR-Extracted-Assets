class admin.Panels.Application.SharedObjects_Tree_Render extends UI.core.movieclip
{
   function SharedObjects_Tree_Render()
   {
      super();
      this.createEmptyMovieClip("IconSpace",0);
      this.createTextField("t1",1,0,0,0,17);
      this.createTextField("t2",4,0,0,100,17);
      this.t1.autoSize = this.t2.autoSize = "left";
      this.t1.selectable = this.t2.selectable = false;
      this.t1.owner = this.t2.owner = this;
      this.t1._y = this.t2._y = 1;
      var _loc3_ = new TextFormat();
      _loc3_.font = "Verdana";
      _loc3_.size = 10;
      this.t2.setNewTextFormat(_loc3_);
      this.t2.multiline = false;
      this.t2.html = false;
      this.t1.html = true;
   }
   function firstDraw()
   {
      this.owner.attachValue("type");
      this.owner.attachValue("dataString");
      this.owner.attachValue("icon");
   }
   function set type(l)
   {
      this.t1.htmlText = l;
      this.t1.autoSize = "left";
      this.t2._x = this.t1._x + this.t1.textWidth + 5;
      this.owner.onChangeWidth();
   }
   function set dataString(d)
   {
      d = this.killWhiteSpace(d);
      this.t2.text = d;
      this.t2.autoSize = "left";
      this.owner.onChangeWidth();
   }
   function killWhiteSpace(d)
   {
      d = unescape(escape(d).split("%0A").join(""));
      d = unescape(escape(d).split("%0D").join(""));
      return d;
   }
   function get label()
   {
      return this.t1.text;
   }
   function set icon(i)
   {
      this.__icon = i;
      this.IconSpace.removeMovieClip();
      this.attachMovie(i,"IconSpace",2);
      this.IconSpace._x = 2;
      this.IconSpace._y = Math.round(this.getHeight() / 2 - this.IconSpace._height / 2);
      this.t1._x = this.IconSpace._width + 3;
      this.t2._x = this.t1._x + this.t1.textWidth + 5;
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
      return this.t2._x + this.t2.textWidth + 10;
   }
}
