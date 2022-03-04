class UI.data.profiles.ServerDetails extends UI.core.events implements UI.data.dataProfile
{
   var maxHistory = 500;
   function ServerDetails()
   {
      super();
      this.__history = new Object();
      this.__history.data_1 = new Array();
      this.__history.data_2 = new Array();
      this.__history.data_3 = new Array();
      this._last = new Object();
      this.blockFocus();
   }
   function onRefresh()
   {
      this.fc.call("getServerStats",new this.ResBind(this.onServerStat,this));
   }
   function onServerStat(result)
   {
      if(result.level == "status")
      {
         var _loc6_ = result.data;
         var _loc2_ = new Object();
         _loc2_.c1 = new Object();
         _loc2_.c1.ac = _loc6_.io.connected;
         _loc2_.c2 = new Object();
         _loc2_.c2.bIn = _loc6_.io.bw_in;
         _loc2_.c2.bOut = _loc6_.io.bw_out;
         _loc2_.c3 = new Object();
         _loc2_.c3.memory = _loc6_.memory_Usage;
         var _loc3_ = _loc6_.cpus <= 1 ? 1 : _loc6_.cpus;
         _loc2_.c3.cpu = _loc6_.cpu_Usage / _loc3_;
         this.__history.data_1.push(_loc2_.c1);
         this.__history.data_2.push(_loc2_.c2);
         this.__history.data_3.push(_loc2_.c3);
         this.dispatchEvent(this.__event,{method:"onChartPush",server:this.__server,data:_loc2_});
      }
   }
   function sendHistory()
   {
      this.dispatchEvent(this.__event,{method:"onHistory",data_1:this.__history.data_1,data_2:this.__history.data_2,data_3:this.__history.data_3});
   }
   function start(sID, event_name)
   {
      this.__server = sID;
      this.__event = event_name;
      this.sendHistory();
   }
}
