class UI.controls.ProgressBar extends UI.core.events
{
   var __border = 6388377;
   var __background = 5076400;
   var __border2 = 6406292;
   var __background2 = 5107109;
   function ProgressBar()
   {
      super();
      this.createEmptyMovieClip("BarBase",0);
      this.createEmptyMovieClip("ProgBase",1);
   }
   function setProgress(comp, total)
   {
      this.__comp = comp;
      this.__total = total;
      var _loc2_ = this.__width / total * comp;
      if(_loc2_ <= 0)
      {
         _loc2_ = 0;
      }
      if(_loc2_ > this.__width)
      {
         _loc2_ = this.__width;
      }
      this.ProgBase.clear();
      if(_loc2_ > 0)
      {
         this.drawRect(this.ProgBase,0,0,_loc2_,this.__height,this.__border2,100);
         this.drawRect(this.ProgBase,1,1,_loc2_ - 2,this.__height - 2,this.__background2,100);
      }
   }
   function setSize(width, height)
   {
      this.__width = width;
      this.__height = height;
      this.drawRect(this.BarBase,0,0,width,height,this.__border,100);
      this.drawRect(this.BarBase,1,1,width - 2,height - 2,this.__background,100);
      this.setProgress(this.__comp,this.__total);
   }
}
