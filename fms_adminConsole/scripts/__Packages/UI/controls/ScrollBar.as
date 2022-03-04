class UI.controls.ScrollBar extends UI.core.events
{
   function ScrollBar()
   {
      super();
      this.attachMovie("BasicScrollBar","__scroll",0);
      this.__scroll.addListener("scroll",this.onScroll,this);
   }
   function onKeyDown()
   {
      if(Key.isDown(40))
      {
         if(this.__get__direction() != "Horizontal")
         {
            this.__scroll.setPosThumb(this.__get__scrollPosition() + 1);
         }
      }
      if(Key.isDown(38))
      {
         if(this.__get__direction() != "Horizontal")
         {
            this.__scroll.setPosThumb(this.__get__scrollPosition() - 1);
         }
      }
      if(Key.isDown(39))
      {
         if(this.__get__direction() == "Horizontal")
         {
            this.__scroll.setPosThumb(this.__get__scrollPosition() + 1);
         }
      }
      if(Key.isDown(37))
      {
         if(this.__get__direction() == "Horizontal")
         {
            this.__scroll.setPosThumb(this.__get__scrollPosition() - 1);
         }
      }
   }
   function onScroll(data)
   {
      this.dispatchEvent("scroll",data);
   }
   function set enabled(e)
   {
      this.__scroll.enabled = e;
   }
   function get max()
   {
      return this.__scroll.max;
   }
   function get enabled()
   {
      return this.__scroll.enabled;
   }
   function get width()
   {
      if(this.__get__direction() == "Horizontal")
      {
         return this.__size;
      }
      return 13;
   }
   function get isScrolling()
   {
      return this.__scroll.isScrolling;
   }
   function get height()
   {
      if(this.__get__direction() == "Horizontal")
      {
         return 13;
      }
      return this.__size;
   }
   function set direction(d)
   {
      if(d == "Horizontal")
      {
         this.__scroll._rotation = -90;
      }
      else
      {
         this.__scroll._rotation = 0;
      }
      this.setSize(this.__size);
   }
   function get direction()
   {
      if(this.__scroll._rotation == -90)
      {
         return "Horizontal";
      }
      return "Vertical";
   }
   function set scrollPosition(p)
   {
      this.__scroll.scrollPosition = p;
   }
   function get scrollPosition()
   {
      return this.__scroll.scrollPosition;
   }
   function setScrollProperties(p1, p2, p3)
   {
      this.__scroll.setScrollProperties(p1,p2,p3);
   }
   function setSize(size)
   {
      this.__size = size;
      this.__scroll.setSize(size);
      if(this.__get__direction() == "Horizontal")
      {
         this.__scroll._y = this.__scroll._height;
      }
      else
      {
         this.__scroll._y = 0;
      }
   }
}
