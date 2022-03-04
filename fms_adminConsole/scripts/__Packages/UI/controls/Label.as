class UI.controls.Label extends UI.core.events
{
   var __autoSize = "none";
   function Label()
   {
      super();
      this.createEmptyMovieClip("UISpace",0);
      this.createTextField("__text",1,0,0,1,1);
      this.__text.type = "dynamic";
      this.__text.tabEnabled = false;
      this.__text.selectable = false;
      this.format = new TextFormat();
      this.format.font = "Verdana";
      this.format.color = 0;
      this.format.size = 10;
      this.__text.setNewTextFormat(this.format);
      var owner = this;
      this.UISpace.onRollOver = function()
      {
         if(owner.__link || owner.__image)
         {
            owner.setFormat("underline",true);
         }
      };
      this.UISpace.onRollOut = this.UISpace.onReleaseOutside = function()
      {
         if(owner.__link || owner.__image)
         {
            owner.setFormat("underline",false);
         }
      };
      this.UISpace.onRelease = function()
      {
         if(owner.__link)
         {
            if(typeof owner.__link == "string")
            {
               this.getURL(owner.__link,"_blank");
            }
            else
            {
               owner.dispatchEvent("click",{target:owner});
            }
         }
         if(owner.__image)
         {
            if(typeof owner.__image == "string")
            {
               owner.dispatchEvent("click",{target:owner});
            }
         }
      };
      this.UISpace.useHandCursor = false;
      this.notab(this.UISpace);
      this.blockFocus();
   }
   function setAlpha(alpha)
   {
      this.__text._alpha = alpha;
   }
   function onSetFocus()
   {
      if(this.__link || this.__image)
      {
         this.setFormat("underline",true);
      }
   }
   function onKillFocus()
   {
      if(this.__link || this.__image)
      {
         this.setFormat("underline",false);
      }
   }
   function onKeyDown()
   {
      if(Key.isDown(13))
      {
         if(this.__link)
         {
            if(typeof this.__link == "string")
            {
               this.getURL(this.__link,"_blank");
            }
            else
            {
               this.dispatchEvent("click",{target:this});
            }
         }
         if(this.__image)
         {
            if(typeof this.__image == "string")
            {
               this.dispatchEvent("click",{target:this});
            }
         }
      }
   }
   function set text(t)
   {
      this.__text.text = t;
      this.adjustForAutoSize();
      this.dispatchEvent("change",{target:this});
   }
   function get text()
   {
      return this.__text.text;
   }
   function get width()
   {
      return this.__width;
   }
   function get height()
   {
      return this.__height;
   }
   function set link(l)
   {
      this.__link = l;
      this.UISpace.useHandCursor = true;
   }
   function getText()
   {
      return this.__text;
   }
   function set image(image)
   {
      this.__image = image;
      this.UISpace.useHandCursor = true;
   }
   function getImage()
   {
      return this.__image;
   }
   function get image()
   {
      return this.__image;
   }
   function setEmbedFonts(embed)
   {
      this.__text.embedFonts = embed;
   }
   function setFormat(prop, val)
   {
      this.format[prop] = val;
      this.__text.setTextFormat(this.format);
      this.__text.setNewTextFormat(this.format);
      if(this.__autoSize != "none")
      {
         this.adjustForAutoSize();
      }
   }
   function get autoSize()
   {
      return this.__autoSize;
   }
   function set autoSize(v)
   {
      this.__autoSize = v;
      this.adjustForAutoSize();
   }
   function setSize(width, height)
   {
      this.__width = width;
      this.__height = height;
      this.UISpace.clear();
      this.drawRect(this.UISpace,0,0,width,height,0,0);
      this.__text._width = width;
      this.__text._height = height;
   }
   function adjustForAutoSize()
   {
      var _loc2_ = this.__text;
      var _loc3_ = this.__autoSize;
      if(_loc3_ != undefined && _loc3_ != "none")
      {
         var _loc5_ = _loc2_.textHeight + 6;
         if(this.format.underline == true)
         {
            _loc5_ += 5;
         }
         _loc2_._height = _loc5_;
         var _loc4_ = this.__width;
         this.setSize(_loc2_.textWidth + 5,_loc2_._height);
         if(_loc3_ == "right")
         {
            this._x += _loc4_ - this.__width;
         }
         else if(_loc3_ == "center")
         {
            this._x += (_loc4_ - this.__width) / 2;
         }
         else if(_loc3_ == "left")
         {
            this._x += 0;
         }
      }
      else
      {
         _loc2_._x = 0;
         _loc2_._width = this.__width;
         _loc2_._height = this.__height;
      }
   }
}
