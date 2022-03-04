class UI.controls.ComboClustersTree extends UI.core.events
{
   var __speed = 8;
   var motion = 1;
   function ComboClustersTree()
   {
      super();
      this.isOpen = false;
      this.hasChanged = false;
      this.__treeHeight = 80;
      this.__treeWidth = 200;
      this.attachMovie("Common_Header","UISpace",0);
      this.attachMovie("Label","label_txt",1);
      this.attachMovie("ComboBox_Arrow","ComboArrow",2);
      this.createEmptyMovieClip("HitArea",3);
      this.createEmptyMovieClip("dropMask",4);
      this.attachMovie("ClustersTree","ct",-1);
      this.ComboArrow._y = 10;
      this.ct.attachMovie("ShadowBox","shadow",-1);
      this.ct.shadow._x = -3;
      this.ct.shadow._y = 0;
      this.ct._visible = false;
      this.ct.focusRect = false;
      this.ct.blockFocus();
      this.ct.addListener("change",this.onChange,this);
      this.ct.addListener("onExpand",this.onExpand,this);
      this.ct.addListener("redraw",this.redraw,this);
      this.ct.cTree.canScroll = false;
      this.label_txt.setFormat("color",3361385);
      this.label_txt.setFormat("bold",true);
      this.label_txt._x = 5;
      this.label_txt._y = 7;
      this.label_txt.text = "Select a server";
      this.HitArea.owner = this;
      this.notab(this.HitArea);
      this.HitArea.onPress = function()
      {
         owner.doPress();
         owner.dispatchEvent("onRollOut",{target:this.owner});
      };
      this.HitArea.onRollOver = function()
      {
         owner.dispatchEvent("onRollOver",{target:this.owner});
      };
      this.HitArea.onRollOut = function()
      {
         owner.dispatchEvent("onRollOut",{target:this.owner});
      };
      this.outSideML = new Object();
      var owner = this;
      this.outSideML.onMouseDown = function()
      {
         if(!owner.HitArea.hitTest(_root._xmouse,_root._ymouse,false) && !owner.ct.cTree.rowMask.hitTest(_root._xmouse,_root._ymouse,false))
         {
            owner.showTree(false,false);
         }
      };
   }
   function get hitClip()
   {
      return this.HitArea;
   }
   function redraw()
   {
      var _loc2_ = this.__treeWidth;
      if(_loc2_ < this.__width)
      {
         _loc2_ = this.__width;
      }
      var _loc3_ = this.ct.bottomY;
      this.UISpace.setSize(this.__width - 4);
      this.ct.setSize(this.__width - 4,_loc3_);
      this.shadow.setSize(_loc2_ + 4,_loc3_ + 4);
      this.dropMask.clear();
      this.drawRect(this.dropMask,-3,-2,_loc2_,_loc3_ + 4,16711935,100);
      if(this.endMode == 0)
      {
         this.returnTo = 0;
      }
      else
      {
         this.returnTo = - this.ct.height + 29;
      }
   }
   function doPress()
   {
      this.__down = true;
      this.showTree(!this.isOpen,false);
      this.isOpen = this.isOpen;
   }
   function onSetFocus()
   {
      this.ct.onSetFocus();
   }
   function onKillFocus()
   {
      this.ct.onKillFocus();
   }
   function onKeyDown()
   {
      if(this.isOpen == false)
      {
         if(Key.isDown(13))
         {
            this.showTree(true);
         }
      }
      else
      {
         this.ct.onKeyDown();
         if(Key.isDown(13))
         {
            this.onChange();
         }
         if(Key.isDown(27))
         {
            this.onChange();
         }
      }
   }
   function onRes(result, node)
   {
      this.dispatchEvent("change",{target:this,node:node});
   }
   function onChange(data)
   {
      var _loc4_ = data.node.nodeid;
      if(_loc4_.indexOf("c") == -1)
      {
         if(_global.cm.isConnected(_loc4_) != true)
         {
            this.ct.autoOveride = _loc4_;
            _global.cm.connect(_loc4_,this.onRes,this,data.node);
         }
         this.dispatchEvent("change",{target:this,node:data.node});
         switch(data.node.type)
         {
            case "cluster":
               var _loc6_ = "Cluster: ";
               break;
            case "server":
               _loc6_ = "Server: ";
               break;
            case "vhost":
               _loc6_ = "Vhost: ";
         }
         var _loc3_ = _loc6_ + data.node.label;
         if(_loc3_.length > 27)
         {
            _loc3_ = _loc3_.slice(0,27) + "...";
         }
         this.label_txt.text = _loc3_;
         this.showTree(false);
      }
   }
   function onExpand(evt)
   {
      this.redraw();
   }
   function onTreeRedraw(evt)
   {
      this.dispatchEvent("change",{target:this,node:evt.node});
   }
   function set labelPrefix(label)
   {
      this.__labelPrefix = label;
   }
   function set staticLabel(s)
   {
      this.__staticLabel = s;
      this.label_txt.text = s;
   }
   function getListPos()
   {
      var _loc4_ = {x:0,y:0};
      this.localToGlobal(_loc4_);
      var _loc3_ = false;
      var _loc6_ = false;
      var _loc2_ = 29;
      if(_loc4_.y + _loc2_ + this.ct.height <= this.__get__StageHeight())
      {
         _loc3_ = true;
      }
      if(_loc4_.y - this.ct.height >= 0)
      {
         _loc6_ = true;
      }
      var _loc5_ = undefined;
      if(this.direction == 0)
      {
         _loc3_ = false;
      }
      else if(this.direction == 1)
      {
         _loc3_ = true;
      }
      if(_loc3_ == true)
      {
         var _loc7_ = - this.ct.height;
         var _loc11_ = _loc2_;
         this.endMode = 1;
         _loc5_ = - this.ct.height + _loc2_;
      }
      else
      {
         _loc7_ = 0;
         _loc11_ = - this.ct.height;
         this.endMode = 0;
         _loc5_ = 0;
      }
      return {start:- this.ct.bottomY,end:_loc2_,returnPos:- this.ct.bottomY + _loc2_};
   }
   function showTree(s, inform)
   {
      this.isOpen = s;
      if(s == true)
      {
         this.redraw();
         Mouse.addListener(this.outSideML);
         this.hasChanged = false;
         this.motion = 1;
         this.ct._visible = true;
         var _loc2_ = this.getListPos();
         this.returnTo = _loc2_.returnPos;
         var _loc4_ = _loc2_.start;
         var _loc3_ = _loc2_.end;
         this.dropMask._y = _loc3_;
         var _loc5_ = new mx.transitions.Tween(this.ct,"_y",mx.transitions.easing.Regular.easeOut,_loc4_,_loc3_,this.__speed,false);
         this.dispatchEvent("open",{target:this});
      }
      else
      {
         Mouse.removeListener(this.outSideML);
         this.motion = 0;
         _loc5_ = new mx.transitions.Tween(this.ct,"_y",mx.transitions.easing.Regular.easeOut,this.ct._y,this.returnTo,this.__speed,false);
         var owner = this;
         _loc5_.onMotionFinished = function()
         {
            if(owner.motion == 0)
            {
               owner.ct._visible = false;
            }
         };
         if(inform != false)
         {
            this.dispatchEvent("close",{target:this});
            if(this.ct.selectedItem != undefined)
            {
               if(this.lastSelected != this.ct.selectedIndex)
               {
                  this.dispatchEvent("change",{target:this});
               }
            }
            this.lastSelected = this.ct.selectedIndex;
         }
      }
   }
   function setSize(width)
   {
      if(this.__treeWidth == this.__width)
      {
         this.__treeWidth = this.__width;
      }
      this.__width = width;
      var _loc3_ = 24;
      this.label_txt.setSize(width - 29,20);
      this.ComboArrow._x = width - 24;
      this.HitArea.clear();
      this.drawRect(this.HitArea,0,0,width,_loc3_,16777215,0);
      this.ct.setMask(this.dropMask);
      this.redraw();
   }
}
