class UI.core.focusManager extends UI.core.movieclip
{
   function focusManager()
   {
      super();
      _global.fm = this;
      this.tabOrders = new Object();
      this.tabs = new Array();
      this.__index = 0;
      this.__indexRef = new Object();
      this.hitList = new Array();
      this.tm = new UI.core.tabManager(this);
      _global.tabs.registerContext("main");
      Mouse.addListener(this);
      Key.addListener(this);
      this.fr = _root.createEmptyMovieClip("fcm_focusrect",20);
   }
   function onMouseDown()
   {
      var mcFocus = false;
      if(eval(Selection.getFocus()) instanceof TextField == true)
      {
         mcFocus = true;
      }
      var i = 0;
      while(i < this.hitList.length)
      {
         var mc = this.hitList[i];
         var mcHit = mc;
         if(mc.hitClip)
         {
            mcHit = mc.hitClip;
         }
         if(mcHit.hitTest(_root._xmouse,_root._ymouse,false))
         {
            if(!(_global.form_manager.whiteSpace._visible == true && mc.inForm != true))
            {
               if(this.isVisible(mc) != false)
               {
                  this.doFocus(mc);
                  break;
               }
            }
         }
         i++;
      }
   }
   function isVisible(mc)
   {
      var _loc2_ = mc;
      while(_loc2_ != _root)
      {
         if(_loc2_._visible == false)
         {
            return false;
         }
         _loc2_ = _loc2_._parent;
      }
      return true;
   }
   function doFocus(mc)
   {
      _global.tabs.onFocusMC(mc);
      this.fr.clear();
      this.__isFocused.isFocused = false;
      this.__isFocused.dispatchEvent("focusOut",{target:this.__isFocused});
      this.__isFocused.onKillFocus(false);
      mc.isFocused = true;
      mc.onSetFocus(false);
      this.__isFocused = mc;
      mc.dispatchEvent("focusIn",{target:mc});
      this.fr.clear();
   }
   function initFocus(mc)
   {
      this.__isFocused.isFocused = false;
      this.__isFocused.onKillFocus(true);
      mc.isFocused = true;
      mc.onSetFocus(true);
      this.__isFocused = mc;
      this.fr.clear();
      if(mc.focusRect == true)
      {
         this.drawFocusRect(mc);
      }
   }
   function removeAll()
   {
      this.tabOrders = new Array();
   }
   function drawFocusRect(mc)
   {
      var _loc6_ = {x:0,y:0};
      mc.localToGlobal(_loc6_);
      this.fr.lineStyle(1,1270433,100);
      var _loc3_ = _loc6_.x - 1;
      var _loc2_ = _loc6_.y;
      var _loc4_ = mc.width + 2;
      var _loc5_ = mc.height + 1;
      this.dashTo(this.fr,_loc3_,_loc2_,_loc3_,_loc2_ + _loc5_,4,8);
      this.dashTo(this.fr,_loc3_,_loc2_ + _loc5_,_loc3_ + _loc4_,_loc2_ + _loc5_,4,8);
      this.dashTo(this.fr,_loc3_ + _loc4_,_loc2_ + _loc5_,_loc3_ + _loc4_,_loc2_,4,8);
      this.dashTo(this.fr,_loc3_ + _loc4_,_loc2_,_loc3_,_loc2_,4,8);
   }
   function registerMC(mc)
   {
      this.hitList.push(mc);
   }
   function blockFocus(mc)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.hitList.length)
      {
         if(mc == this.hitList[_loc2_])
         {
            this.hitList.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function onKeyDown()
   {
      this.__isFocused.onKeyDown();
   }
   function onKeyUp()
   {
      this.__isFocused.onKeyUp();
   }
   function dashTo(mc, startx, starty, endx, endy, len, gap)
   {
      var _loc11_ = undefined;
      var _loc8_ = undefined;
      var _loc7_ = undefined;
      var _loc9_ = undefined;
      var _loc2_ = undefined;
      var _loc1_ = undefined;
      _loc11_ = len + gap;
      _loc8_ = endx - startx;
      _loc7_ = endy - starty;
      var _loc10_ = Math.sqrt(_loc8_ * _loc8_ + _loc7_ * _loc7_);
      _loc9_ = Math.floor(Math.abs(_loc10_ / _loc11_));
      var _loc4_ = Math.atan2(_loc7_,_loc8_);
      _loc2_ = startx;
      _loc1_ = starty;
      _loc8_ = Math.cos(_loc4_) * _loc11_;
      _loc7_ = Math.sin(_loc4_) * _loc11_;
      var _loc3_ = 0;
      while(_loc3_ < _loc9_)
      {
         mc.moveTo(_loc2_,_loc1_);
         mc.lineTo(_loc2_ + Math.cos(_loc4_) * len,_loc1_ + Math.sin(_loc4_) * len);
         _loc2_ += _loc8_;
         _loc1_ += _loc7_;
         _loc3_ = _loc3_ + 1;
      }
      mc.moveTo(_loc2_,_loc1_);
      _loc10_ = Math.sqrt((endx - _loc2_) * (endx - _loc2_) + (endy - _loc1_) * (endy - _loc1_));
      if(_loc10_ > len)
      {
         mc.lineTo(_loc2_ + Math.cos(_loc4_) * len,_loc1_ + Math.sin(_loc4_) * len);
      }
      else if(_loc10_ > 0)
      {
         mc.lineTo(_loc2_ + Math.cos(_loc4_) * _loc10_,_loc1_ + Math.sin(_loc4_) * _loc10_);
      }
      mc.moveTo(endx,endy);
   }
}
