class UI.controls.Button extends UI.core.events
{
   function Button()
   {
      super();
      this.createEmptyMovieClip("UISpace",0);
      this.createTextField("label_txt",1,0,0,50,50);
      this.createEmptyMovieClip("hitSpace",3);
      this.space4 = this.UISpace;
      this.space4.attachMovie("SB_S1","p1",10);
      this.space4.attachMovie("SB_S2","p2",11);
      this.space4.attachMovie("SB_S3","p3",12);
      this.space4.p1._x = this.space4.p2._x = this.space4.p3._x = 2;
      this.space4.p1._y = this.space4.p2._y = this.space4.p3._y = 2;
      this.space4.p2._x = 2 + this.space4.p1._width;
      this.space4.p1._yscale = 50;
      this.space4.p2._yscale = 50;
      this.space4.p3._yscale = 50;
      this.label_txt.autoSize = true;
      this.label_txt.selectable = false;
      this.label_txt.owner = this;
      var _loc3_ = new TextFormat();
      _loc3_.font = "Verdana";
      _loc3_.size = 10;
      this.label_txt.setNewTextFormat(_loc3_);
      this.UISpace.attachMovie("Button_lower_left","bll",0);
      this.UISpace.attachMovie("Button_lower_right","blr",1);
      this.UISpace.attachMovie("Button_top_left","btl",2);
      this.UISpace.attachMovie("Button_top_right","btr",3);
      this.UISpace.attachMovie("Button_top_bar","btb",4);
      this.UISpace.attachMovie("Button_body","body",5);
      this.UISpace.attachMovie("Button_left_bar","blb",6);
      this.UISpace.attachMovie("Button_right_bar","brb",7);
      this.UISpace.attachMovie("Button_lower_bar","blbb",8);
      this.UISpace.btb._x = this.UISpace.body._x = this.UISpace.body._y = this.UISpace.blb._y = this.UISpace.brb._y = this.UISpace.blbb._x = 5;
      var owner = this;
      this.hitSpace.onPress = this.space4.onPress = function()
      {
         owner.doPress();
      };
      this.hitSpace.onRollOver = function()
      {
         owner.doRollOver();
      };
      this.hitSpace.onRelease = this.space4.onRelease = function()
      {
         owner.doRelease();
      };
      this.hitSpace.onReleaseOutside = this.space4.onReleaseOutside = function()
      {
         owner.doRollOut();
      };
      this.hitSpace.onRollOut = function()
      {
         owner.doRollOut();
      };
      this.hitSpace.useHandCursor = false;
      this.hitSpace._focusrect = false;
      this.hitSpace.tabEnabled = false;
      this.space4.useHandCursor = false;
      this.space4._focusrect = false;
      this.space4.tabEnabled = false;
      this.setSurface(1);
   }
   function onSetFocus(tab)
   {
      if(tab == true)
      {
         this.doRollOver();
      }
      else
      {
         this.doPress();
      }
   }
   function onKillFocus(tab)
   {
      if(tab != false)
      {
         if(this.__enable != false)
         {
            this.__down = false;
            this.setSurface(-1);
         }
      }
      this.dispatchEvent("onRollOut",{target:this});
   }
   function onKeyDown()
   {
      if(Key.isDown(13) || Key.isDown(32))
      {
         this.doPress();
         this.__waitForUp = true;
      }
   }
   function onKeyUp()
   {
      if(this.__waitForUp == true)
      {
         this.doRelease();
         this.__waitForUp = false;
      }
   }
   function doPress()
   {
      if(this.__enable != false)
      {
         this.__down = true;
         this.setSurface(3);
         this.dispatchEvent("onRollOut",{target:this});
      }
   }
   function doRelease()
   {
      if(this.__enable != false)
      {
         this.dispatchEvent("click",{target:this});
         this.__down = false;
         this.setSurface(-1);
      }
   }
   function doRollOver()
   {
      this.dispatchEvent("onRollOver",{target:this});
      if(this.__enable != false)
      {
         this.__over = false;
         this.setSurface(2);
      }
   }
   function doRollOut()
   {
      this.dispatchEvent("onRollOut",{target:this});
      if(this.__enable != false)
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
   function set icon(i)
   {
      this.__icon_holder.removeMovieClip();
      this.attachMovie(i,"__icon_holder",2);
      this.setSize(this.__width,this.__height);
   }
   function get label()
   {
      return this.label_txt.text;
   }
   function set label(l)
   {
      this.label_txt.text = l;
      this.setSize(this.__width,this.__height);
   }
   function setSize(width, height)
   {
      this.UISpace.bll._y = this.UISpace.blr._y = this.UISpace.blbb._y = height - 5;
      this.UISpace.blr._x = this.UISpace.btr._x = this.UISpace.brb._x = width - 5;
      this.UISpace.btb._width = width - 10;
      this.UISpace.body._width = this.UISpace.blbb._width = width - 10;
      this.UISpace.body._height = this.UISpace.blb._height = this.UISpace.brb._height = height - 10;
      this.label_txt._x = Math.round(width / 2 - this.label_txt.textWidth / 2) - 3;
      this.label_txt._y = Math.round(height / 2 - this.label_txt.textHeight / 2) - 2;
      this.__icon_holder._x = width / 2 - this.__icon_holder._width / 2 - this.label_txt.textWidth;
      this.__icon_holder._y = height / 2 - this.__icon_holder._height / 2;
      var _loc4_ = width - 4;
      this.space4.p2._width = _loc4_ - (this.space4.p1._width + this.space4.p3._width);
      this.space4.p3._x = _loc4_ - this.space4.p3._width + 2;
      this.hitSpace.clear();
      this.drawRect(this.hitSpace,0,0,width,height,0,0);
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
   }
}
