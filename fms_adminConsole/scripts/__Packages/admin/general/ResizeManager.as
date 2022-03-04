class admin.general.ResizeManager
{
   var __context = 1;
   function ResizeManager()
   {
      _global.ResizeManager = this;
      this.__contexts = new Object();
   }
   function manageClip(context, mc, dat)
   {
      if(!this.__contexts[context])
      {
         this.__contexts[context] = new Object();
      }
      var _loc2_ = this.__contexts[context];
      dat.mc = mc;
      _loc2_[mc] = dat;
   }
   function contextID()
   {
      return this.__context++;
   }
   function unmanageClip(context, mc)
   {
      var _loc2_ = this.__contexts[context];
      _loc2_[mc] = null;
      delete _loc2_[mc];
   }
   function editData(context, mc)
   {
      var _loc2_ = this.__contexts[context];
      return _loc2_[mc];
   }
   function setSize(ct, w, h)
   {
      for(var _loc5_ in this.__contexts[ct])
      {
         var _loc2_ = this.__contexts[ct][_loc5_];
         var _loc3_ = _loc2_.mc;
         this.workClip(_loc3_,_loc2_,w,h);
      }
   }
   function workClip(mc, dat, __w, __h)
   {
      if(dat.height != undefined || dat.width != undefined)
      {
         var _loc7_ = mc._width;
         var _loc6_ = mc._height;
         if(dat.width != undefined)
         {
            _loc7_ = this.datToVal(dat.width,__w,"_width");
         }
         if(dat.height != undefined)
         {
            _loc6_ = this.datToVal(dat.height,__h,"_height");
         }
         this.SizeMC(mc,_loc7_,_loc6_,dat);
      }
      if(dat.x != undefined || dat.y != undefined)
      {
         var _loc5_ = mc._x;
         var _loc4_ = mc._y;
         if(dat.x != undefined)
         {
            _loc5_ = this.datToVal(dat.x,__w,"_x");
         }
         if(dat.y != undefined)
         {
            _loc4_ = this.datToVal(dat.y,__h,"_y");
         }
         if(!dat.height)
         {
            this.MoveMC(mc,_loc5_,_loc4_,dat,true);
         }
         else
         {
            this.MoveMC(mc,_loc5_,_loc4_,dat,mc._visible);
         }
      }
      if(dat.xMin)
      {
         if(mc._x < dat.xMin)
         {
            mc._visible = false;
         }
         else
         {
            mc._visible = true;
         }
      }
      if(dat.yMin)
      {
         if(mc._y < dat.yMin)
         {
            mc._visible = false;
         }
         else
         {
            mc._visible = true;
         }
      }
   }
   function datToVal(dat, wDat, type)
   {
      if(dat.charAt(0) == "-")
      {
         return wDat - Number(dat.slice(1,dat.length));
      }
      if(dat.charAt(dat.length - 1) == "%")
      {
         var _loc2_ = Number(dat.slice(0,dat.length - 1));
         var _loc3_ = wDat / 100;
         return Math.round(_loc3_ * _loc2_);
      }
      if(typeof dat == "movieclip")
      {
         return dat[type];
      }
      return Number(dat);
   }
   function MoveMC(mc, x, y, dat, isV)
   {
      mc._x = x;
      mc._y = y;
      if(dat.minX != undefined)
      {
         if(x <= dat.minX)
         {
            isV = false;
         }
      }
      if(dat.minY != undefined)
      {
         if(y <= dat.minY)
         {
            isV = false;
         }
      }
      if(mc._visible != isV)
      {
         mc._visible = isV;
      }
   }
   function SizeMC(mc, w, h, dat)
   {
      var _loc2_ = true;
      if(dat.minWidth != undefined)
      {
         if(w <= dat.minWidth)
         {
            _loc2_ = false;
         }
      }
      if(dat.minHeight != undefined)
      {
         if(h < dat.minHeight)
         {
            _loc2_ = false;
         }
      }
      if(!mc.setSize)
      {
         mc._width = w;
         mc._height = h;
      }
      else
      {
         mc.setSize(w,h);
      }
      if(mc._visible != _loc2_)
      {
         mc._visible = _loc2_;
      }
   }
}
