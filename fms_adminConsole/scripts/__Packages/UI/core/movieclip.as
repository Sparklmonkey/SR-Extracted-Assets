class UI.core.movieclip extends MovieClip
{
   function movieclip()
   {
      super();
   }
   function onError(msg)
   {
      _global.am.onError(msg);
   }
   function onInfo(msg, ico)
   {
      _global.am.onInfo(msg,ico);
   }
   function get StageWidth()
   {
      return _global.stg.__width;
   }
   function get StageHeight()
   {
      return _global.stg.__height;
   }
   function addToolTip(text, target)
   {
      _global.tt.addToolTip(text,target);
   }
   function drawRect(mc, x, y, w, h, fill, alpha, cornerRadius)
   {
      if(w < 0 || h < 0)
      {
         return undefined;
      }
      if(cornerRadius > 0)
      {
         var _loc2_ = undefined;
         var _loc3_ = undefined;
         var _loc8_ = undefined;
         var _loc7_ = undefined;
         var _loc10_ = undefined;
         var _loc9_ = undefined;
         if(cornerRadius > Math.min(w,h) / 2)
         {
            cornerRadius = Math.min(w,h) / 2;
         }
         _loc2_ = 0.7853981633974483;
         mc.moveTo(x + cornerRadius,y);
         if(fill != null)
         {
            mc.beginFill(fill,alpha);
         }
         mc.lineTo(x + w - cornerRadius,y);
         _loc3_ = -1.5707963267948966;
         _loc8_ = x + w - cornerRadius + Math.cos(_loc3_ + _loc2_ / 2) * cornerRadius / Math.cos(_loc2_ / 2);
         _loc7_ = y + cornerRadius + Math.sin(_loc3_ + _loc2_ / 2) * cornerRadius / Math.cos(_loc2_ / 2);
         _loc10_ = x + w - cornerRadius + Math.cos(_loc3_ + _loc2_) * cornerRadius;
         _loc9_ = y + cornerRadius + Math.sin(_loc3_ + _loc2_) * cornerRadius;
         mc.curveTo(_loc8_,_loc7_,_loc10_,_loc9_);
         _loc3_ += _loc2_;
         _loc8_ = x + w - cornerRadius + Math.cos(_loc3_ + _loc2_ / 2) * cornerRadius / Math.cos(_loc2_ / 2);
         _loc7_ = y + cornerRadius + Math.sin(_loc3_ + _loc2_ / 2) * cornerRadius / Math.cos(_loc2_ / 2);
         _loc10_ = x + w - cornerRadius + Math.cos(_loc3_ + _loc2_) * cornerRadius;
         _loc9_ = y + cornerRadius + Math.sin(_loc3_ + _loc2_) * cornerRadius;
         mc.curveTo(_loc8_,_loc7_,_loc10_,_loc9_);
         mc.lineTo(x + w,y + h - cornerRadius);
         _loc3_ += _loc2_;
         _loc8_ = x + w - cornerRadius + Math.cos(_loc3_ + _loc2_ / 2) * cornerRadius / Math.cos(_loc2_ / 2);
         _loc7_ = y + h - cornerRadius + Math.sin(_loc3_ + _loc2_ / 2) * cornerRadius / Math.cos(_loc2_ / 2);
         _loc10_ = x + w - cornerRadius + Math.cos(_loc3_ + _loc2_) * cornerRadius;
         _loc9_ = y + h - cornerRadius + Math.sin(_loc3_ + _loc2_) * cornerRadius;
         mc.curveTo(_loc8_,_loc7_,_loc10_,_loc9_);
         _loc3_ += _loc2_;
         _loc8_ = x + w - cornerRadius + Math.cos(_loc3_ + _loc2_ / 2) * cornerRadius / Math.cos(_loc2_ / 2);
         _loc7_ = y + h - cornerRadius + Math.sin(_loc3_ + _loc2_ / 2) * cornerRadius / Math.cos(_loc2_ / 2);
         _loc10_ = x + w - cornerRadius + Math.cos(_loc3_ + _loc2_) * cornerRadius;
         _loc9_ = y + h - cornerRadius + Math.sin(_loc3_ + _loc2_) * cornerRadius;
         mc.curveTo(_loc8_,_loc7_,_loc10_,_loc9_);
         mc.lineTo(x + cornerRadius,y + h);
         _loc3_ += _loc2_;
         _loc8_ = x + cornerRadius + Math.cos(_loc3_ + _loc2_ / 2) * cornerRadius / Math.cos(_loc2_ / 2);
         _loc7_ = y + h - cornerRadius + Math.sin(_loc3_ + _loc2_ / 2) * cornerRadius / Math.cos(_loc2_ / 2);
         _loc10_ = x + cornerRadius + Math.cos(_loc3_ + _loc2_) * cornerRadius;
         _loc9_ = y + h - cornerRadius + Math.sin(_loc3_ + _loc2_) * cornerRadius;
         mc.curveTo(_loc8_,_loc7_,_loc10_,_loc9_);
         _loc3_ += _loc2_;
         _loc8_ = x + cornerRadius + Math.cos(_loc3_ + _loc2_ / 2) * cornerRadius / Math.cos(_loc2_ / 2);
         _loc7_ = y + h - cornerRadius + Math.sin(_loc3_ + _loc2_ / 2) * cornerRadius / Math.cos(_loc2_ / 2);
         _loc10_ = x + cornerRadius + Math.cos(_loc3_ + _loc2_) * cornerRadius;
         _loc9_ = y + h - cornerRadius + Math.sin(_loc3_ + _loc2_) * cornerRadius;
         mc.curveTo(_loc8_,_loc7_,_loc10_,_loc9_);
         mc.lineTo(x,y + cornerRadius);
         _loc3_ += _loc2_;
         _loc8_ = x + cornerRadius + Math.cos(_loc3_ + _loc2_ / 2) * cornerRadius / Math.cos(_loc2_ / 2);
         _loc7_ = y + cornerRadius + Math.sin(_loc3_ + _loc2_ / 2) * cornerRadius / Math.cos(_loc2_ / 2);
         _loc10_ = x + cornerRadius + Math.cos(_loc3_ + _loc2_) * cornerRadius;
         _loc9_ = y + cornerRadius + Math.sin(_loc3_ + _loc2_) * cornerRadius;
         mc.curveTo(_loc8_,_loc7_,_loc10_,_loc9_);
         _loc3_ += _loc2_;
         _loc8_ = x + cornerRadius + Math.cos(_loc3_ + _loc2_ / 2) * cornerRadius / Math.cos(_loc2_ / 2);
         _loc7_ = y + cornerRadius + Math.sin(_loc3_ + _loc2_ / 2) * cornerRadius / Math.cos(_loc2_ / 2);
         _loc10_ = x + cornerRadius + Math.cos(_loc3_ + _loc2_) * cornerRadius;
         _loc9_ = y + cornerRadius + Math.sin(_loc3_ + _loc2_) * cornerRadius;
         mc.curveTo(_loc8_,_loc7_,_loc10_,_loc9_);
         if(fill != null)
         {
            mc.endFill();
         }
      }
      else
      {
         mc.moveTo(x,y);
         mc.beginFill(fill,alpha);
         mc.lineTo(x + w,y);
         mc.lineTo(x + w,y + h);
         mc.lineTo(x,y + h);
         mc.lineTo(x,y);
         mc.endFill();
      }
   }
   function addControl(type, n, depth, data)
   {
      var _loc3_ = this.attachMovie(type,n,depth);
      if(data.width)
      {
         _loc3_.setSize(data.width,data.height);
      }
      for(var _loc4_ in data)
      {
         if(_loc4_ != "width" && _loc4_ != "height")
         {
            _loc3_[_loc4_] = data[_loc4_];
         }
      }
      return _loc3_;
   }
   function get Cache()
   {
      return _global.conn.__cache;
   }
   function ResBind(method, obj)
   {
      var a = new Array();
      var _loc3_ = 2;
      while(_loc3_ < arguments.length)
      {
         a.push(arguments[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
      this.onResult = function(data)
      {
         a.splice(0,0,data);
         method.apply(obj,a);
      };
   }
   function onAlert(content, width, height, title, owner, white)
   {
      var _loc2_ = _global.form_manager.onAlert(content,width,height,title,owner,white);
      return _loc2_;
   }
   function get Clusters()
   {
      return _global.cm;
   }
   function formatDecimals(num, digits)
   {
      if(digits <= 0)
      {
         return Math.round(num).toString();
      }
      var _loc4_ = Math.pow(10,digits);
      var _loc2_ = String(Math.round(num * _loc4_) / _loc4_);
      if(_loc2_.indexOf(".") == -1)
      {
         _loc2_ += ".0";
      }
      var _loc6_ = _loc2_.split(".");
      var _loc3_ = digits - _loc6_[1].length;
      var _loc1_ = 1;
      while(_loc1_ <= _loc3_)
      {
         _loc2_ += "0";
         _loc1_ = _loc1_ + 1;
      }
      return _loc2_;
   }
}
