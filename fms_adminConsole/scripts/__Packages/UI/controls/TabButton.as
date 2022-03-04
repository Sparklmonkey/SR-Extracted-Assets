class UI.controls.TabButton extends UI.core.events
{
   var __active = false;
   var __enable = false;
   function TabButton()
   {
      super();
      this.createEmptyMovieClip("UISpace",0);
      this.createTextField("label_txt",1,0,0,50,50);
      this.notab(this.UISpace);
      this.label_txt.autoSize = true;
      this.label_txt.selectable = false;
      this.label_txt.owner = this;
      var _loc3_ = new TextFormat();
      _loc3_.font = "verdana";
      _loc3_.size = 10;
      _loc3_.bold = false;
      this.label_txt.setNewTextFormat(_loc3_);
      this.UISpace.attachMovie("TabButton_lower_left","bll",0);
      this.UISpace.attachMovie("TabButton_lower_right","blr",1);
      this.UISpace.attachMovie("TabButton_top_left","btl",2);
      this.UISpace.attachMovie("TabButton_top_right","btr",3);
      this.UISpace.attachMovie("TabButton_top_bar","btb",4);
      this.UISpace.attachMovie("TabButton_body","body",5);
      this.UISpace.attachMovie("TabButton_left_bar","blb",6);
      this.UISpace.attachMovie("TabButton_right_bar","brb",7);
      this.UISpace.attachMovie("TabButton_lower_bar","blbb",8);
      this.UISpace.attachMovie("TabButton_lower_left_center","bllc",9);
      this.UISpace.attachMovie("TabButton_lower_right_center","blrc",10);
      this.UISpace.attachMovie("TabButton_top_left_center","btlc",11);
      this.UISpace.attachMovie("TabButton_top_right_center","btrc",12);
      this.UISpace.btb._x = this.UISpace.body._x = this.UISpace.body._y = this.UISpace.blb._y = this.UISpace.brb._y = this.UISpace.blbb._x = 5;
      var owner = this;
      this.UISpace.onPress = function()
      {
         owner.doPress();
      };
      this.UISpace.onRollOver = function()
      {
         owner.doRollOver();
      };
      this.UISpace.onRelease = function()
      {
         owner.doRelease();
      };
      this.UISpace.onReleaseOutside = function()
      {
         owner.doRelease();
         owner.doRollOut();
      };
      this.UISpace.onRollOut = function()
      {
         owner.doRollOut();
      };
      this.UISpace.useHandCursor = false;
      this.setSurface(1);
   }
   function get ignoreFocus()
   {
      if(this.UISpace.bll._currentframe == 4)
      {
         return true;
      }
      return false;
   }
   function onKillFocus()
   {
      this.doRollOut();
      this.dispatchEvent("onRollOut",{target:this});
   }
   function onSetFocus()
   {
      this.doRollOver();
      if(this.UISpace.bll._currentframe == 4)
      {
         return false;
      }
   }
   function onKeyDown()
   {
      if(Key.isDown(13))
      {
         this.doPress();
      }
   }
   function doPress()
   {
      this.dispatchEvent("onRollOut",{target:this});
      if(this.__enable != false && !this.__active)
      {
         this.dispatchEvent("click",{target:this});
         this.__down = true;
         this.setSurface(3);
      }
   }
   function doRelease()
   {
      if(this.__enable != false && !this.__active)
      {
         this.__down = false;
         this.setSurface(-1);
      }
   }
   function doRollOver()
   {
      this.dispatchEvent("onRollOver",{target:this});
      if(this.__enable != false && !this.__active)
      {
         this.__over = true;
         this.setSurface(2);
      }
   }
   function doRollOut()
   {
      this.dispatchEvent("onRollOut",{target:this});
      if(this.__enable != false && !this.__active)
      {
         this.__over = false;
         this.setSurface(1);
      }
   }
   function set enabled(e)
   {
      this.__enable = e;
      if(e == false)
      {
         this.setSurface(0);
      }
      else
      {
         this.setSurface(-1);
      }
   }
   function set active(e)
   {
      this.__active = e;
      if(e == false)
      {
         this.setSurface(0);
      }
      else
      {
         this.setSurface(3);
      }
   }
   function set icon(i)
   {
      this.__icon_holder.removeMovieClip();
      this.attachMovie(i,"__icon_holder",2);
      this.setSize(this.__width,this.__height);
   }
   function set label(l)
   {
      this.label_txt.text = l;
      this.setSize(this.__width,this.__height);
   }
   function get label()
   {
      return this.label_txt.text;
   }
   function set data(d)
   {
      this.__data = d;
   }
   function get data()
   {
      return this.__data;
   }
   function setType(type)
   {
      switch(type)
      {
         case "left":
            this.UISpace.bllc._visible = false;
            this.UISpace.btlc._visible = false;
            break;
         case "center":
            this.UISpace.bll._visible = false;
            this.UISpace.btl._visible = false;
            this.UISpace.blr._visible = false;
            this.UISpace.btr._visible = false;
            break;
         case "right":
            this.UISpace.blrc._visible = false;
            this.UISpace.btrc._visible = false;
      }
   }
   function setSize(width, height)
   {
      this.UISpace.bll._y = this.UISpace.blr._y = this.UISpace.blbb._y = this.UISpace.bllc._y = this.UISpace.blrc._y = height - 5;
      this.UISpace.blr._x = this.UISpace.btr._x = this.UISpace.brb._x = this.UISpace.blrc._x = this.UISpace.btrc._x = width - 5;
      this.UISpace.btb._width = width - 10;
      this.UISpace.body._width = this.UISpace.blbb._width = width - 10;
      this.UISpace.body._height = this.UISpace.blb._height = this.UISpace.brb._height = height - 10;
      this.label_txt._x = Math.round(width / 2 - this.label_txt.textWidth / 2) - 3;
      this.label_txt._y = Math.round(height / 2 - this.label_txt.textHeight / 2) - 2;
      this.__icon_holder._x = width / 2 - this.__icon_holder._width / 2 - this.label_txt.textWidth;
      this.__icon_holder._y = height / 2 - this.__icon_holder._height / 2;
      this.__width = width;
      this.__height = height;
   }
   function setSurface(type)
   {
      if(type == -1)
      {
         type = 1;
         if(this.__over == true)
         {
            type = 2;
         }
         if(this.__down == true)
         {
            type = 3;
         }
      }
      var _loc2_ = type + 1;
      this.UISpace.bll.gotoAndStop(_loc2_);
      this.UISpace.blr.gotoAndStop(_loc2_);
      this.UISpace.btl.gotoAndStop(_loc2_);
      this.UISpace.btr.gotoAndStop(_loc2_);
      this.UISpace.btb.gotoAndStop(_loc2_);
      this.UISpace.body.gotoAndStop(_loc2_);
      this.UISpace.blb.gotoAndStop(_loc2_);
      this.UISpace.brb.gotoAndStop(_loc2_);
      this.UISpace.blbb.gotoAndStop(_loc2_);
      this.UISpace.bllc.gotoAndStop(_loc2_);
      this.UISpace.blrc.gotoAndStop(_loc2_);
      this.UISpace.btlc.gotoAndStop(_loc2_);
      this.UISpace.btrc.gotoAndStop(_loc2_);
   }
}
