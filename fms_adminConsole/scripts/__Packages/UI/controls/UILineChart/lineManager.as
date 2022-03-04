class UI.controls.UILineChart.lineManager extends UI.core.movieclip
{
   var peak = 0;
   function lineManager()
   {
      super();
      this.createEmptyMovieClip("UISpace",0);
   }
   function clear()
   {
      this.UISpace.clear();
   }
   function setColor(col)
   {
      this.UISpace.lineStyle(1,col,100);
   }
   function start(x, y)
   {
      this.UISpace.moveTo(x,y);
   }
   function lineTo(x, y, val)
   {
      if(val > this.peak)
      {
         this.peak = val;
      }
      this.UISpace.lineTo(x,y);
   }
}
