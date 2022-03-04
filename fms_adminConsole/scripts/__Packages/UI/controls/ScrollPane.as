class UI.controls.ScrollPane extends UI.core.events
{
   var _yoffset = 0;
   var _xoffset = 0;
   var __width = 0;
   var __height = 0;
   var isContainer = true;
   function ScrollPane()
   {
      super();
      this.attachMovie("ScrollBar","__vScroll",1);
      this.attachMovie("ScrollBar","__hScroll",2);
      this.createEmptyMovieClip("__mask",3);
      this.__hScroll.direction = "Horizontal";
      this.__vScroll._visible = this.__hScroll._visible = false;
      this.__vScroll.addListener("scroll",this.onVScroll,this);
      this.__hScroll.addListener("scroll",this.onHScroll,this);
   }
   function onVScroll()
   {
      this.__content._y = - this.__vScroll.scrollPosition;
      this.dispatchEvent("scroll",{target:this,vPosition:this.__vScroll.scrollPosition,hPosition:this.__hScroll.scrollPosition});
   }
   function onHScroll()
   {
      this.__content._x = - this.__hScroll.scrollPosition;
      this.dispatchEvent("scroll",{target:this,vPosition:this.__vScroll.scrollPosition,hPosition:this.__hScroll.scrollPosition});
   }
   function set content(c)
   {
      this.__content.removeMovieClip();
      this.attachMovie(c,"__content",0);
      this.__content.setMask(this.__mask);
      this.refresh();
   }
   function get content()
   {
      return this.__content;
   }
   function get vPosition()
   {
      return this.__vScroll.scrollPosition;
   }
   function get hPosition()
   {
      return this.__hScroll.scrollPosition;
   }
   function set vPosition(p)
   {
      this.__vScroll.scrollPosition = p;
   }
   function set hPosition(p)
   {
      this.__hScroll.scrollPosition = p;
   }
   function refresh()
   {
      if(this.__content._height > this.__height)
      {
         this.__vScroll._visible = true;
         this._xoffset = 16;
      }
      else
      {
         this.__vScroll._visible = false;
         this._xoffset = 0;
      }
      if(this.__content._width > this.__width)
      {
         this.__hScroll._visible = true;
         this._yoffset = 16;
      }
      else
      {
         this.__hScroll._visible = false;
         this._yoffset = 0;
      }
      var _loc2_ = this.__content._height - this.__height + this._yoffset;
      this.__vScroll.setScrollProperties(_loc2_,0,_loc2_);
      _loc2_ = this.__content._width - this.__width + this._xoffset;
      this.__hScroll.setScrollProperties(_loc2_,0,_loc2_);
      this.reposition();
   }
   function setSize(width, height)
   {
      this.__width = width;
      this.__height = height;
      this.__mask.clear();
      this.drawRect(this.__mask,0,0,width - this._xoffset,height - this._yoffset,16777215,100);
      this.__content.setMask(this.__mask);
      this.reposition();
      this.refresh();
   }
   function reposition()
   {
      this.__vScroll._x = this.__width - 16;
      this.__vScroll.setSize(this.__height);
      this.__hScroll._y = this.__height - 16;
      if(this.__vScroll._visible == true)
      {
         this.__hScroll.setSize(this.__width - 16);
      }
      else
      {
         this.__hScroll.setSize(this.__width);
      }
   }
}
