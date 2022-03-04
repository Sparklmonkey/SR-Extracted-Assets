class admin.general.BandwidthChart extends UI.core.movieclip
{
   static var bType = [{label:"Kilobits",value:125},{label:"Megabits",value:125000},{label:"Gigabits",value:125000000}];
   function BandwidthChart()
   {
      super();
      this.attachMovie("LineChart","lc",0);
      this.attachMovie("Label","typeLabel",1);
      this.typeLabel.autoSize = "left";
      this.lc.absoluteLabel = true;
      this.lc.registerProperty("bOut",26367,"Out");
      this.lc.registerProperty("bIn",10079232,"In");
      this.lc.registerProperty("bTotal",3027090,"Total");
      this.lc.addListener("onItemClick",this.onItemClick,this);
      this.lc.setScaleUI(0,100,[{value:0,label:0},{value:100,label:100}],[25,50,75]);
      this.inHistory = new Object();
      this.inHistory.min = Infinity;
      this.inHistory.max = - Infinity;
      this.outHistory = new Object();
      this.outHistory.min = Infinity;
      this.outHistory.max = - Infinity;
      this.totalHistory = new Object();
      this.totalHistory.min = Infinity;
      this.totalHistory.max = - Infinity;
   }
   function onItemClick()
   {
      this.rescale();
   }
   function clear()
   {
      this.inHistory = new Object();
      this.inHistory.min = Infinity;
      this.inHistory.max = - Infinity;
      this.outHistory = new Object();
      this.outHistory.min = Infinity;
      this.outHistory.max = - Infinity;
      this.totalHistory = new Object();
      this.totalHistory.min = Infinity;
      this.totalHistory.max = - Infinity;
      this.lc.clear();
   }
   function dump(dat)
   {
      var _loc4_ = new Object();
      _loc4_.max = - Infinity;
      _loc4_.min = Infinity;
      var _loc2_ = 0;
      while(_loc2_ < dat.length)
      {
         dat[_loc2_].bTotal = dat[_loc2_].bIn + dat[_loc2_].bOut;
         _loc4_.min = Math.min(_loc4_.min,dat[_loc2_].bIn);
         _loc4_.min = Math.min(_loc4_.min,dat[_loc2_].bOut);
         _loc4_.min = Math.min(_loc4_.min,dat[_loc2_].bTotal);
         _loc4_.max = Math.max(_loc4_.max,dat[_loc2_].bIn);
         _loc4_.max = Math.max(_loc4_.max,dat[_loc2_].bOut);
         _loc4_.max = Math.max(_loc4_.max,dat[_loc2_].bTotal);
         this.updateHistory(this.outHistory,dat[_loc2_].bOut);
         this.updateHistory(this.inHistory,dat[_loc2_].bIn);
         this.updateHistory(this.totalHistory,dat[_loc2_].bTotal);
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = this.sortByte(_loc4_.max);
      this.workScale(_loc4_,_loc5_);
      this.lc.dump(dat);
   }
   function push(r)
   {
      var _loc4_ = r.bIn;
      var _loc5_ = r.bOut;
      var _loc6_ = r.bIn + r.bOut;
      var _loc2_ = false;
      _loc2_ = this.updateHistory(this.outHistory,_loc5_,_loc2_);
      _loc2_ = this.updateHistory(this.inHistory,_loc4_,_loc2_);
      _loc2_ = this.updateHistory(this.totalHistory,_loc6_,_loc2_);
      if(_loc2_ == true)
      {
         this.rescale();
      }
      this.lc.push({bIn:_loc4_,bOut:_loc5_,bTotal:_loc6_});
   }
   function rescale()
   {
      var _loc2_ = new Object();
      _loc2_.min = Infinity;
      _loc2_.max = - Infinity;
      if(this.lc.isVisible("bIn") == true)
      {
         _loc2_.min = Math.min(this.inHistory.min,_loc2_.min);
         _loc2_.max = Math.max(this.inHistory.max,_loc2_.max);
      }
      if(this.lc.isVisible("bOut") == true)
      {
         _loc2_.min = Math.min(this.outHistory.min,_loc2_.min);
         _loc2_.max = Math.max(this.outHistory.max,_loc2_.max);
      }
      if(this.lc.isVisible("bTotal") == true)
      {
         _loc2_.min = Math.min(this.totalHistory.min,_loc2_.min);
         _loc2_.max = Math.max(this.totalHistory.max,_loc2_.max);
      }
      var _loc3_ = this.sortByte(_loc2_.max);
      this.workScale(_loc2_,_loc3_);
   }
   function roundUp(n, to)
   {
      return Math.ceil(n / to) * to;
   }
   function roundDown(n, to)
   {
      return Math.floor(n / to) * to;
   }
   function workScale(history, format)
   {
      var _loc2_ = this.roundUp(history.max,admin.general.BandwidthChart.bType[format].value * 0.5);
      var _loc3_ = this.roundDown(history.min,admin.general.BandwidthChart.bType[format].value * 0.5);
      if(_loc2_ == _loc3_)
      {
         _loc2_ += admin.general.BandwidthChart.bType[format].value;
      }
      if(this.lc.max == _loc2_ && this.lc.min == _loc3_)
      {
         return undefined;
      }
      var _loc8_ = _loc2_ - _loc3_;
      var _loc4_ = Math.round(this.getValue(_loc2_,format));
      var _loc6_ = Math.round(this.getValue(_loc3_,format));
      var _loc9_ = _loc2_ - _loc8_ / 2;
      var _loc5_ = Math.round(this.getValue(_loc9_,format));
      if(_loc4_ == _loc6_)
      {
         _loc4_ += 2;
      }
      if(_loc5_ == _loc4_ || _loc5_ == _loc6_)
      {
         _loc4_ += 1;
         _loc5_ = 1;
      }
      if(_loc4_ == NaN || _loc6_ == NaN || _loc5_ == NaN)
      {
         return undefined;
      }
      if(_loc2_ == - Infinity || _loc3_ == Infinity)
      {
         return undefined;
      }
      if(_loc2_ < 0 || _loc3_ < 0 || _loc4_ < 0 || _loc6_ < 0)
      {
         return undefined;
      }
      this.lc.setScaleUI(_loc3_,_loc2_,[{label:_loc4_,value:_loc2_},{label:_loc5_,value:_loc9_},{label:_loc6_,value:_loc3_}],[_loc2_ - _loc8_ / 4,_loc2_ - _loc8_ / 2,_loc2_ - _loc8_ / 4 * 3]);
      this.typeLabel.text = admin.general.BandwidthChart.bType[format].label;
      this.typeLabel._x = (this.__width - this.typeLabel.width) / 2;
   }
   function getValue(n, f)
   {
      return n / admin.general.BandwidthChart.bType[f].value;
   }
   function updateHistory(obj, val, rd)
   {
      if(val > obj.max)
      {
         obj.max = val;
         rd = true;
      }
      if(val < obj.min)
      {
         obj.min = val;
         rd = true;
      }
      return rd;
   }
   function sortByte(b)
   {
      var _loc1_ = admin.general.BandwidthChart.bType.length;
      while(_loc1_ != 0)
      {
         _loc1_ = _loc1_ - 1;
         if(b > admin.general.BandwidthChart.bType[_loc1_].value)
         {
            return _loc1_;
         }
      }
      return 0;
   }
   function setSize(w, h)
   {
      this.__width = w;
      this.lc.setSize(w,h);
      this.typeLabel._y = h - 17;
      this.typeLabel._x = (w - this.typeLabel.width) / 2;
   }
}
