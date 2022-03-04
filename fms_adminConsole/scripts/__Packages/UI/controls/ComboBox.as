class UI.controls.ComboBox extends UI.core.events
{
   var __speed = 12;
   var motion = 1;
   var __input = false;
   var firstOpen = false;
   var __active = true;
   function ComboBox()
   {
      super();
      this.isOpen = false;
      this.hasChanged = false;
      this.__listHeight = 80;
      this.__listWidth = 80;
      this.createEmptyMovieClip("UISpace",0);
      this.createTextField("label_txt",1,0,0,50,50);
      this.attachMovie("ComboBox_Arrow","ComboArrow",2);
      this.createEmptyMovieClip("HitArea",3);
      this.createEmptyMovieClip("dropMask",4);
      this.attachMovie("List","lb",-1);
      this.lb._visible = false;
      this.lb.focusRect = false;
      this.lb.blockFocus();
      this.lb.addListener("change",this.onChange,this);
      this.label_txt.selectable = false;
      this.label_txt.owner = this;
      var _loc4_ = new TextFormat();
      _loc4_.font = "Verdana";
      _loc4_.size = 10;
      this.label_txt.setNewTextFormat(_loc4_);
      this.label_txt._x = this.label_txt._y = 4;
      this.label_txt.text = "";
      this.ComboArrow._y = 7;
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
      this.space4 = this.UISpace;
      this.space4.attachMovie("SB_S1","p1",9);
      this.space4.attachMovie("SB_S2","p2",10);
      this.space4.attachMovie("SB_S3","p3",11);
      this.space4.p1._x = this.space4.p2._x = this.space4.p3._x = 2;
      this.space4.p1._y = this.space4.p2._y = this.space4.p3._y = 2;
      this.space4.p2._x = 2 + this.space4.p1._width;
      this.space4.p1._yscale = 50;
      this.space4.p2._yscale = 50;
      this.space4.p3._yscale = 50;
      this.HitArea.owner = this;
      this.HitArea.onPress = function()
      {
         owner.doPress();
      };
      this.HitArea.onRollOver = function()
      {
         owner.__over = true;
         owner.doRollOver();
      };
      this.HitArea.onRollOut = function()
      {
         owner.__over = false;
         owner.doRollOut();
      };
      this.HitArea.onRelease = this.HitArea.onReleaseOutside = function()
      {
         owner.setSurface(1);
      };
      this.notab(this.HitArea);
      this.HitArea.useHandCursor = false;
      this.outSideML = new Object();
      var owner = this;
      this.outSideML.onMouseDown = function()
      {
         var _loc3_ = owner.lb.listBase.hitTest(_root._xmouse,_root._ymouse,false);
         var _loc2_ = owner.HitArea.hitTest(_root._xmouse,_root._ymouse,false);
         if(!_loc3_ && !_loc2_)
         {
            owner.showList(false,false);
         }
      };
      this.setSurface(1);
   }
   function onTChange()
   {
      this.dispatchEvent("textChange",{target:this});
   }
   function onFocusIn()
   {
      this.dispatchEvent("setFocus",{target:this});
   }
   function onFocusOut()
   {
      this.dispatchEvent("killFocus",{target:this});
   }
   function set input(b)
   {
      if(b == true)
      {
         this.UISpace._visible = false;
         this.attachMovie("TextInput","label_txt",1);
         this.label_txt.addListener("change",this.onTChange,this);
         this.label_txt.setSize(100,20);
         this.label_txt.addListener("focusIn",this.onFocusIn,this);
         this.label_txt.addListener("focusOut",this.onFocusOut,this);
         if(!this.textDown)
         {
            this.createEmptyMovieClip("textDown",5);
            this.drawRect(this.textDown,0,-1,17,20,8625087,100);
            this.textDown._y = 1;
            this.textDown.attachMovie("Button_body","body",0);
            this.textDown.body.gotoAndStop(2);
            this.textDown.body._width = 15;
            this.textDown.body._x = 1;
            this.textDown.body._height = 18;
            this.drawRect(this.textDown,0,0,1,18,7308196,100);
            this.textDown.createEmptyMovieClip("l2",1);
            this.drawRect(this.textDown.l2,1,0,1,18,16777215,20);
            this.textDown.attachMovie("SB_S2","hl",2);
            this.textDown.hl._x = 1;
            this.textDown.hl._y = 0;
            this.textDown.hl._width = 15;
            this.textDown.hl._height = 8;
            this.textDown.attachMovie("ComboBox_Arrow_p2","a",3);
            this.textDown.a._x = 5;
            this.textDown.a._y = 7;
            this.ComboArrow._visible = false;
         }
      }
      this.__input = b;
      this.setSize(this.__width);
   }
   function get hitClip()
   {
      if(this.lb._visible == true)
      {
         return this.lb;
      }
      return this.HitArea;
   }
   function set listHeight(nh)
   {
      this.__listHeight = nh;
      this.redraw();
   }
   function set listWidth(nw)
   {
      this.__listWidth = nw;
      this.redraw();
   }
   function setText(t)
   {
      this.label_txt.text = t;
   }
   function get text()
   {
      return this.label_txt.text;
   }
   function redraw()
   {
      var _loc4_ = this.__listHeight;
      var _loc3_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < this.lb.length)
      {
         if(this.lb.getItemAt(_loc2_).type == "spacer")
         {
            _loc3_ += 3;
         }
         else
         {
            _loc3_ += 20;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc3_ += 4;
      if(_loc3_ < _loc4_)
      {
         _loc4_ = _loc3_;
      }
      var _loc5_ = this.__listWidth;
      if(this.__width > _loc5_)
      {
         _loc5_ = this.__width;
      }
      this.lb.setSize(_loc5_,_loc4_);
      this.dropMask.clear();
      this.drawRect(this.dropMask,0,0,_loc5_,_loc4_,16777215,100);
   }
   function doPress()
   {
      this.__down = true;
      this.setSurface(3);
      this.showList(!this.isOpen,false);
      this.isOpen = this.isOpen;
      this.dispatchEvent("onRollOut",{target:this});
   }
   function doRollOver()
   {
      this.dispatchEvent("onRollOver",{target:this});
      if(this.UISpace.bll._currentframe != 4)
      {
         this.setSurface(2);
      }
   }
   function doRollOut()
   {
      this.dispatchEvent("onRollOut",{target:this});
      if(this.__over != true)
      {
         this.setSurface(1);
      }
   }
   function onSetFocus()
   {
      if(Key.isDown(9))
      {
         this.doRollOver();
      }
      this.lb.onSetFocus();
   }
   function onKillFocus()
   {
      this.doRollOut();
      this.lb.onKillFocus();
      this.dispatchEvent("onRollOut",{target:this});
   }
   function onKeyDown()
   {
      if(this.isOpen == false)
      {
         if(Key.isDown(13) || Key.isDown(32))
         {
            this.showList(true);
         }
      }
      else
      {
         this.lb.onKeyDown();
         if(Key.isDown(13) || Key.isDown(32))
         {
            this.onChange();
         }
         if(Key.isDown(27))
         {
            this.onChange();
         }
      }
   }
   function onChange(data)
   {
      if(data.key != true)
      {
         this.showList(false);
         this.isOpen = false;
         if(!this.__staticLabel)
         {
            if(this.__input == true)
            {
               this.label_txt.setText(this.lb.selectedItem.label);
            }
            else
            {
               this.label_txt.text = this.lb.selectedItem.label;
            }
         }
      }
   }
   function set staticLabel(s)
   {
      this.__staticLabel = s;
      this.label_txt.text = s;
   }
   function addItem(data, rd)
   {
      this.lb.addItem(data,rd);
   }
   function addItemAt(i, data, rd)
   {
      this.lb.addItemAt(i,data,rd);
   }
   function removeItemAt(i)
   {
      this.lb.removeItemAt(i);
   }
   function removeAll()
   {
      this.lb.removeAll();
   }
   function get selectedItem()
   {
      return this.lb.selectedItem;
   }
   function set selectedIndex(i)
   {
      this.lb.selectedIndex = i;
      this.lastSelected = this.lb.selectedItem;
      if(!this.__staticLabel)
      {
         if(this.__input == true)
         {
            this.label_txt.setText(this.lb.selectedItem.label);
         }
         else
         {
            this.label_txt.text = this.lb.selectedItem.label;
         }
      }
   }
   function get selectedIndex()
   {
      return this.lb.selectedIndex;
   }
   function getItemAt(i)
   {
      return this.lb.getItemAt(i);
   }
   function get length()
   {
      return this.lb.length;
   }
   function getListPos()
   {
      var _loc4_ = {x:0,y:0};
      this.localToGlobal(_loc4_);
      var _loc2_ = false;
      var _loc6_ = false;
      if(_loc4_.y + 24 + this.lb.height <= this.__get__StageHeight())
      {
         _loc2_ = true;
      }
      if(_loc4_.y - this.lb.height >= 0)
      {
         _loc6_ = true;
      }
      var _loc3_ = undefined;
      if(this.direction == 0)
      {
         _loc2_ = false;
      }
      else if(this.direction == 1)
      {
         _loc2_ = true;
      }
      if(_loc2_ == true)
      {
         var _loc5_ = - this.lb.height;
         if(this.__input != true)
         {
            var _loc7_ = 23;
            _loc3_ = - this.lb.height + 23;
         }
         else
         {
            _loc7_ = 19;
            _loc3_ = - this.lb.height + 19;
         }
      }
      else
      {
         _loc5_ = 0;
         _loc7_ = - this.lb.height;
         _loc3_ = 0;
      }
      return {start:_loc5_,end:_loc7_,returnPos:_loc3_};
   }
   function showList(s, inform)
   {
      this.isOpen = s;
      if(s == true)
      {
         this.firstOpen = true;
         this.redraw();
         Mouse.addListener(this.outSideML);
         this.hasChanged = false;
         this.motion = 1;
         if(this.lb.length != 0)
         {
            this.lb._visible = true;
         }
         this.lb.onSetFocus();
         var _loc2_ = this.getListPos();
         this.returnTo = _loc2_.returnPos;
         var _loc4_ = _loc2_.start;
         var _loc3_ = _loc2_.end;
         this.dropMask._y = _loc3_;
         var _loc5_ = new mx.transitions.Tween(this.lb,"_y",mx.transitions.easing.Strong.easeOut,_loc4_,_loc3_,this.__speed,false);
         this.dispatchEvent("open",{target:this});
      }
      else
      {
         Mouse.removeListener(this.outSideML);
         this.motion = 0;
         _loc5_ = new mx.transitions.Tween(this.lb,"_y",mx.transitions.easing.Strong.easeOut,this.lb._y,this.returnTo,this.__speed,false);
         this.lb.onKillFocus();
         var owner = this;
         _loc5_.onMotionFinished = function()
         {
            if(owner.motion == 0)
            {
               owner.lb._visible = false;
            }
         };
         if(inform != false)
         {
            this.dispatchEvent("close",{target:this});
            if(this.lb.selectedItem != undefined)
            {
               if(this.lastSelected != this.lb.selectedIndex)
               {
                  this.dispatchEvent("change",{target:this});
               }
            }
            this.lastSelected = this.lb.selectedIndex;
         }
      }
   }
   function setSize(width)
   {
      if(this.__listWidth == this.__width)
      {
         this.__listWidth = this.__width;
      }
      this.__width = width;
      var _loc3_ = 24;
      if(this.__input == true)
      {
         this.textDown._x = width - 17;
         this.label_txt.setSize(width - 15,20);
         this.HitArea.clear();
         this.drawRect(this.HitArea,width - 16,0,16,_loc3_,16777215,0);
      }
      else
      {
         this.label_txt._width = width - 15;
         this.UISpace.bll._y = this.UISpace.blr._y = this.UISpace.blbb._y = _loc3_ - 5;
         this.UISpace.blr._x = this.UISpace.btr._x = this.UISpace.brb._x = width - 5;
         this.UISpace.btb._width = width - 10;
         this.UISpace.body._width = this.UISpace.blbb._width = width - 10;
         this.UISpace.body._height = this.UISpace.blb._height = this.UISpace.brb._height = _loc3_ - 10;
         var _loc4_ = width - 4;
         this.space4.p2._width = _loc4_ - (this.space4.p1._width + this.space4.p3._width);
         this.space4.p3._x = _loc4_ - this.space4.p3._width + 2;
         this.HitArea.clear();
         this.drawRect(this.HitArea,0,0,width,_loc3_,16777215,0);
         this.lb.setMask(this.dropMask);
      }
      this.ComboArrow._x = width - 18;
      this.redraw();
   }
   function clearSelection()
   {
      this.lb.clearSelection();
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
      if(this.__input != true)
      {
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
      else
      {
         this.textDown.body.gotoAndStop(_loc2_);
      }
   }
   function activateButton()
   {
      this.HitArea.owner = this;
      this.HitArea.onPress = function()
      {
         this.owner.doPress();
      };
      this.HitArea.onRollOver = function()
      {
         this.owner.__over = true;
         this.owner.doRollOver();
      };
      this.HitArea.onRollOut = function()
      {
         this.owner.__over = false;
         this.owner.doRollOut();
      };
      this.HitArea.onRelease = this.HitArea.onReleaseOutside = function()
      {
         this.owner.setSurface(1);
      };
      Selection.setFocus(null);
      this.__active = true;
   }
   function deactivateButton()
   {
      this.HitArea.onPress = this.HitArea.onRollOver = this.HitArea.onRollOut = this.HitArea.onRelease = null;
      this.__active = false;
   }
   function isActive()
   {
      return this.__active;
   }
}
