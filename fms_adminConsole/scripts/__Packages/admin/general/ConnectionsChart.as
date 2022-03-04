class admin.general.ConnectionsChart extends UI.core.movieclip
{
   static var bType = [{label:"",value:1},{label:"Hundreds of Connections",value:100},{label:"Thousands of Connections",value:1000}];
   function ConnectionsChart()
   {
      super();
      this.attachMovie("LineChart","lc",0);
      this.attachMovie("Label","typeLabel",1);
      this.typeLabel.autoSize = "left";
      this.lc.absoluteLabel = true;
      this.lc.registerProperty("ac",26367,"Active Connections");
      this.lc.addListener("onItemClick",this.onItemClick,this);
      this.lc.setScaleUI(0,100,[{value:0,label:0},{value:100,label:100}],[25,50,75]);
      this.acHistory = new Object();
      this.acHistory.min = Infinity;
      this.acHistory.max = - Infinity;
   }
   function onItemClick()
   {
      this.rescale();
   }
   function clear()
   {
      this.acHistory = new Object();
      this.acHistory.min = Infinity;
      this.acHistory.max = - Infinity;
      this.lc.clear();
   }
   function dump(dat)
   {
      var _loc3_ = new Object();
      _loc3_.max = - Infinity;
      _loc3_.min = Infinity;
      var _loc2_ = 0;
      while(_loc2_ < dat.length)
      {
         _loc3_.min = Math.min(_loc3_.min,dat[_loc2_].ac);
         _loc3_.max = Math.max(_loc3_.max,dat[_loc2_].ac);
         this.updateHistory(this.acHistory,dat[_loc2_].ac);
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = this.sortByte(_loc3_.max);
      this.workScale(_loc3_,_loc5_);
      this.lc.dump(dat);
   }
   function push(r)
   {
      var _loc3_ = r.ac;
      var _loc2_ = false;
      _loc2_ = this.updateHistory(this.acHistory,_loc3_,_loc2_);
      if(_loc2_ == true)
      {
         this.rescale();
      }
      this.lc.push({ac:_loc3_});
   }
   function rescale()
   {
      var _loc2_ = new Object();
      _loc2_.min = Infinity;
      _loc2_.max = - Infinity;
      if(this.lc.isVisible("ac") == true)
      {
         _loc2_.min = Math.min(this.acHistory.min,_loc2_.min);
         _loc2_.max = Math.max(this.acHistory.max,_loc2_.max);
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
      var _loc2_ = this.roundUp(history.max,admin.general.ConnectionsChart.bType[format].value);
      var _loc3_ = 0;
      if(_loc2_ == _loc3_)
      {
         if(_loc2_ == 0)
         {
            _loc2_ = 2;
            _loc3_ = 0;
         }
         else if(_loc2_ == 1)
         {
            _loc2_ = 2;
            _loc3_ = 0;
         }
         else
         {
            _loc2_ += admin.general.ConnectionsChart.bType[format].value;
            _loc3_ -= admin.general.ConnectionsChart.bType[format].value;
         }
      }
      if(this.lc.max == _loc2_ && this.lc.min == _loc3_)
      {
         return undefined;
      }
      if(_loc2_ != - Infinity)
      {
         while(_loc2_ % 4 != 0)
         {
            _loc2_ = _loc2_ + 1;
         }
      }
      var _loc5_ = _loc2_ - _loc3_;
      var _loc7_ = Math.round(this.getValue(_loc2_,format));
      var _loc8_ = Math.round(this.getValue(_loc3_,format));
      var _loc9_ = _loc2_ - _loc5_ / 2;
      var _loc6_ = Math.round(this.getValue(_loc9_,format));
      if(_loc7_ == _loc8_)
      {
         _loc7_ += 1;
      }
      if(_loc6_ == _loc7_ || _loc6_ == _loc8_)
      {
         _loc6_ = 0.5;
      }
      if(_loc2_ == - Infinity || _loc3_ == Infinity)
      {
         return undefined;
      }
      this.lc.setScaleUI(_loc3_,_loc2_,[{label:_loc7_,value:_loc2_},{label:_loc6_,value:_loc9_},{label:_loc8_,value:_loc3_}],[_loc2_ - _loc5_ / 4,_loc2_ - _loc5_ / 2,_loc2_ - _loc5_ / 4 * 3]);
      this.typeLabel.text = admin.general.ConnectionsChart.bType[format].label;
      this.typeLabel._x = (this.__width - this.typeLabel.width) / 2;
   }
   function getValue(n, f)
   {
      return n / admin.general.ConnectionsChart.bType[f].value;
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
      var _loc1_ = admin.general.ConnectionsChart.bType.length;
      while(_loc1_ != 0)
      {
         _loc1_ = _loc1_ - 1;
         if(b > admin.general.ConnectionsChart.bType[_loc1_].value)
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
