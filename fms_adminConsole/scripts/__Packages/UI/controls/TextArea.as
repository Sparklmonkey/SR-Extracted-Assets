class UI.controls.TextArea extends UI.core.events
{
   var __background = 16777215;
   var __border = 8625087;
   var __holder = "";
   function TextArea()
   {
      super();
      this.createEmptyMovieClip("UISpace",0);
      this.createTextField("__text",1,1,1,1,1);
      this.attachMovie("ScrollBar","vScroll",2);
      this.vScroll._y = 2;
      this.vScroll.addListener("scroll",this.onVScroll,this);
      this.vScroll.blockFocus();
      this.__text.addListener(this);
      this.__text.tabEnabled = true;
      this.format = new TextFormat();
      this.format.font = "verdana";
      this.format.size = 10;
      this.__text.setNewTextFormat(this.format);
      this.__text.editable = false;
      this.__text.multiline = true;
      this.__text.wordWrap = true;
      this.__text.html = false;
      var owner = this;
      this.__text.onSetFocus = function()
      {
         if(this.text == owner.__holder && owner.__holder != "")
         {
            this.text = "";
         }
         owner.dispatchEvent("focusIn",{target:owner});
      };
      this.__text.onKillFocus = function()
      {
         if(this.text == "" && owner.__holder != "")
         {
            this.text = owner.__holder;
         }
         owner.dispatchEvent("focusOut",{target:owner});
      };
      this.__text.onChanged = function()
      {
         owner.dispatchEvent("change",{target:owner});
      };
      var owner = this;
      this.__text.onScroller = function()
      {
         owner.vScroll.scrollPosition = this.scroll;
      };
      this.mListener = new Object();
      this.mListener.onMouseWheel = function(delta)
      {
         owner.doWheel(delta);
      };
   }
   function doWheel(delta)
   {
      this.vScroll.scrollPosition -= delta;
   }
   function onSetFocus()
   {
      Mouse.addListener(this.mListener);
   }
   function onKillFocus()
   {
      Mouse.removeListener(this.mListener);
   }
   function onVScroll()
   {
      this.__text.scroll = this.vScroll.scrollPosition;
   }
   function set holder(h)
   {
      if(this.__text.text == this.__holder)
      {
         this.__text.text = h;
      }
      if(this.__text.text == "")
      {
         this.__text.text = h;
      }
      this.__holder = h;
   }
   function set text(t)
   {
      this.__text.htmlText = t;
      this.dispatchEvent("change",{target:this});
      this.refresh();
   }
   function get holder()
   {
      return this.__holder;
   }
   function get text()
   {
      return this.__text.htmlText;
   }
   function getText()
   {
      return this.__text;
   }
   function set editable(b)
   {
      if(b == true)
      {
         this.__text.type = "input";
      }
      else
      {
         this.__text.type = "dynamic";
      }
      this.__text.editable = b;
   }
   function get editable()
   {
      if(this.__text.type == "input")
      {
         return true;
      }
      return false;
   }
   function set selectable(s)
   {
      this.__text.selectable = s;
   }
   function get selectable()
   {
      return this.__text.selectable;
   }
   function get html()
   {
      return this.__text.html;
   }
   function set html(b)
   {
      this.__text.html = b;
   }
   function get multiline()
   {
      return this.__text.multiline;
   }
   function set multiline(m)
   {
      this.__text.multiline = m;
   }
   function set background(b)
   {
      this.__background = b;
      this.setSize(this.__width,this.__height);
   }
   function set border(b)
   {
      this.__border = b;
      this.setSize(this.__width,this.__height);
   }
   function setFormat(prop, val)
   {
      this.format[prop] = val;
      this.__text.setTextFormat(this.format);
      this.__text.setNewTextFormat(this.format);
      this.refresh();
   }
   function setSize(width, height)
   {
      this.__width = width;
      this.__height = height;
      this.UISpace.clear();
      this.drawRect(this.UISpace,0,0,width,height,this.__border,100);
      this.drawRect(this.UISpace,1,1,width - 2,height - 2,this.__background,100);
      this.__text._width = width - 2;
      this.__text._height = height - 2;
      this.vScroll._x = width - 15;
      this.vScroll.setSize(height - 4);
      this.refresh();
   }
   function refresh()
   {
      this.__text._width = this.__width - 14;
      if(this.__text.textHeight > this.__height)
      {
         this.vScroll._visible = true;
      }
      else
      {
         this.vScroll._visible = false;
      }
      var _loc2_ = this.__text.maxscroll;
      var _loc3_ = this.__height / 14;
      this.vScroll.setScrollProperties(_loc3_,1,_loc2_);
      this.vScroll.scrollPosition = this.__text.scroll;
      if(this.vScroll._visible == true)
      {
         this.__text._width = this.__width - 14;
      }
      else
      {
         this.__text._width = this.__width - 2;
      }
   }
   function setVScrollPosition(position)
   {
      this.vScroll.scrollPosition = position;
   }
   function getVScrollPosition(position)
   {
      return Math.ceil(this.vScroll.scrollPosition);
   }
   function getMaxVScrollPosition()
   {
      return this.__text.maxscroll;
   }
}
