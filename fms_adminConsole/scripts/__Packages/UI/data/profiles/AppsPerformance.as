class UI.data.profiles.AppsPerformance extends UI.core.events implements UI.data.dataProfile
{
   function AppsPerformance()
   {
      super();
      this._history = new Object();
      this._last = new Object();
      this.blockFocus();
      this._history.data_3 = new Array();
   }
   function clearApplication(a)
   {
      delete this._history[a];
   }
   function onRefresh()
   {
      if(this.fc.adminLevel.admin_type != "vhost")
      {
         this.fc.call("getServerStats",new this.ResBind(this.onServStat,this));
      }
      else
      {
         this.fc.call("getInstanceStats",new this.ResBind(this.onInstStat,this),this._app);
      }
   }
   function onServStat(result)
   {
      if(result.level == "status")
      {
         this.fc.call("getInstanceStats",new this.ResBind(this.onInstStat,this,result.data),this._app);
      }
   }
   function onInstStat(result, sObj)
   {
      if(result.level == "status")
      {
         var _loc7_ = result.data;
         result.method = "onInstStat";
         this.dispatchEvent(this.__event,result);
         var _loc2_ = new Object();
         _loc2_.c1 = new Object();
         _loc2_.c1.ac = _loc7_.connected;
         _loc2_.c2 = new Object();
         if(this._last[this._app].time != undefined)
         {
            var _loc4_ = getTimer();
            _loc2_.c2.bIn = (_loc7_.bytes_in - this._last[this._app].bytes_in) * 1000 / (_loc4_ - this._last[this._app].time);
            _loc2_.c2.bOut = (_loc7_.bytes_out - this._last[this._app].bytes_out) * 1000 / (_loc4_ - this._last[this._app].time);
            this._last[this._app].time = _loc4_;
            this._last[this._app].bytes_in = _loc7_.bytes_in;
            this._last[this._app].bytes_out = _loc7_.bytes_out;
         }
         else
         {
            _loc2_.c2.bIn = 0;
            _loc2_.c2.bOut = 0;
            this._last[this._app].time = getTimer();
            this._last[this._app].bytes_in = _loc7_.bytes_in;
            this._last[this._app].bytes_out = _loc7_.bytes_out;
         }
         if(sObj)
         {
            _loc2_.c3 = new Object();
            _loc2_.c3.memory = sObj.memory_Usage;
            var _loc6_ = sObj.cpus <= 1 ? 1 : sObj.cpus;
            _loc2_.c3.cpu = sObj.cpu_Usage / _loc6_;
            this._history.data_3.push(_loc2_.c3);
         }
         this._history[this._app].data_1.push(_loc2_.c1);
         this._history[this._app].data_2.push(_loc2_.c2);
         this.dispatchEvent(this.__event,{method:"onChartPush",data:_loc2_});
      }
   }
   function sendHistory()
   {
      this.dispatchEvent(this.__event,{method:"onHistory",data_1:this._history[this._app].data_1,data_2:this._history[this._app].data_2,data_3:this._history.data_3});
   }
   function start(sID, event_name)
   {
      this.__server = sID;
      this.__event = event_name;
      this.sendHistory();
   }
   function onSetApp(app)
   {
      if(!this._history[app])
      {
         this._history[app] = new Object();
         this._history[app].data_1 = new Array();
         this._history[app].data_2 = new Array();
         this._last[app] = new Object();
      }
      this._app = app;
      this.sendHistory();
   }
}
