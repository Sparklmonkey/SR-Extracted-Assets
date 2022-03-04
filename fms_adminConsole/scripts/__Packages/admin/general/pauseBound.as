class admin.general.pauseBound extends UI.core.movieclip
{
   function pauseBound()
   {
      super();
      this.attachMovie("ShadowBox","sb",0);
      this.createEmptyMovieClip("base",1);
      this.sb.space4._visible = false;
      this.sb.space2._visible = false;
      var _loc3_ = new Color(this.sb);
      _loc3_.setRGB(16450048);
   }
   function setSize(w, h)
   {
      this.sb.setSize(w,h);
      this.base.clear();
      this.base.lineStyle(1,16450048,100);
      this.drawRect(this.base,3,3,w - 8,h - 8,null,100,6);
   }
}
