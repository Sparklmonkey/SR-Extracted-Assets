class UI.controls.TextInput extends UI.core.events
{
   var __background = 16777215;
   var __border = 8625087;
   var __holder = "";
   function TextInput()
   {
      super();
      this.createEmptyMovieClip("UISpace",0);
      this.createEmptyMovieClip("__textFocus",1);
      this.createTextField("__text",2,1,1,1,1);
      this.__text.type = "input";
      this.__text.tabEnabled = false;
      this.format = new TextFormat();
      this.format.font = "Verdana";
      this.format.size = 10;
      this.__text.setNewTextFormat(this.format);
      this.rolloverDetect.owner = this;
      this.rolloverDetect.onRollOver = function()
      {
         this._visible = false;
         owner.dispatchEvent("onRollOver",{target:owner});
      };
      this.rolloverDetect.onRollOut = function()
      {
         this._visible = true;
         owner.dispatchEvent("onRollOut",{target:owner});
      };
      var owner = this;
      this.__text.onSetFocus = function()
      {
         _global.fm.fr.clear();
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
         if(owner.noEvent != true)
         {
            owner.dispatchEvent("change",{target:owner});
         }
         else
         {
            owner.noEvent = false;
         }
      };
   }
   function set password(p)
   {
      this.__text.password = p;
   }
   function onSetFocus(tabbed)
   {
   }
   function onKillFocus()
   {
   }
   function onKeyDown()
   {
      if(Key.isDown(13) == true)
      {
         this.dispatchEvent("enter",{target:this});
      }
   }
   function tabOwner()
   {
      return this.__text;
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
      this.__text.text = t;
      this.dispatchEvent("change",{target:this});
   }
   function setText(t)
   {
      this.__text.text = t;
   }
   function get holder()
   {
      return this.__holder;
   }
   function get text()
   {
      return this.__text.text;
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
   }
   function set enabled(b)
   {
      this.__set__editable(b);
   }
   function get enabled()
   {
      return this.__get__editable();
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
      this.__textFocus.clear();
      this.drawRect(this.__textFocus,0,0,this.__text._width,this.__text._height,0,0);
   }
}
