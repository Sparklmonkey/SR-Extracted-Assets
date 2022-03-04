class UI.controls.UIList.List_spacer extends UI.core.events
{
   function List_spacer()
   {
      super();
      this.createEmptyMovieClip("UISpace",1);
   }
   function getBestHeight()
   {
      return 3;
   }
   function getWidth()
   {
      return 0;
   }
   function get type()
   {
      return "spacer";
   }
   function setSize(width, height)
   {
      this.UISpace.clear();
      this.drawRect(this.UISpace,0,1,width,1,12961221,100);
      this.hitSpace.clear();
      this.drawRect(this.hitSpace,0,0,width,height,16777215,0);
      this.hitSpace.onPress = function()
      {
      };
      this.hitSpace.useHandCursor = false;
      this.hitSpace._focusrect = false;
      this.hitSpace.tabChildren = false;
      this.hitSpace.tabEnabled = false;
      this.__width = width;
      this.__height = height;
   }
}
