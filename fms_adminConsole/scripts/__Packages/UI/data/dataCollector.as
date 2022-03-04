class UI.data.dataCollector extends UI.core.events
{
   var __profiles = new Object();
   var __eventIndex = 0;
   var __timeoutPeriod = 1200000;
   function dataCollector()
   {
      super();
      _global.dat_c = this;
      this.blockFocus();
      setInterval(this.checkForTimeOut,60000);
   }
   function get length()
   {
      var _loc2_ = 0;
      for(var _loc3_ in this.__profiles)
      {
         _loc2_ = _loc2_ + 1;
      }
      return _loc2_;
   }
   function onRefresh()
   {
      for(var _loc2_ in this.__profiles)
      {
         this.__profiles[_loc2_].mc.onRefresh();
      }
   }
   function activateDataProfile(profile_name, server_cacheID, callBack, context)
   {
      var _loc4_ = this.__profiles[profile_name + server_cacheID];
      if(_loc4_ != undefined)
      {
         _loc4_.lastAccess = getTimer();
         _loc4_.mc.fc = _global.conn.getFC(server_cacheID);
         _loc4_.mc.addListener("data" + profile_name + server_cacheID,callBack,context);
         _loc4_.mc.__server = server_cacheID;
         _loc4_.mc.fc = _global.conn.getFC(server_cacheID);
         _loc4_.mc.onRefresh();
         _loc4_.mc.sendHistory();
         return _loc4_.mc;
      }
      var _loc6_ = this.attachMovie(profile_name,"profile_" + this.__eventIndex,this.__eventIndex + 1);
      _loc6_.addListener("data" + profile_name + server_cacheID,callBack,context);
      _loc6_.fc = _global.conn.getFC(server_cacheID);
      _loc6_.__server = server_cacheID;
      _loc6_.start(server_cacheID,"data" + profile_name + server_cacheID);
      _loc6_.onRefresh();
      this.__profiles[profile_name + server_cacheID] = {name:profile_name,server:server_cacheID,mc:_loc6_,lastAccess:getTimer()};
      this.__eventIndex = this.__eventIndex + 1;
      return _loc6_;
   }
   function deactivateDataProfile(profile_name, server_cacheID, callBack, context)
   {
      this.__profiles[profile_name + server_cacheID].mc.removeListener("data" + profile_name + server_cacheID,callBack);
   }
   function sendToProfile(name, sID, method, data)
   {
      return this.__profiles[name + sID].mc.method(data);
   }
   function clear()
   {
      for(var _loc2_ in this.__profiles)
      {
         this.deleteProfile(this.__profiles[_loc2_]);
         this.__profiles[_loc2_] = null;
         delete this.__profiles[_loc2_];
      }
   }
   function flushProfiles(server_cacheID)
   {
      for(var _loc3_ in this.__profiles)
      {
         if(this.__profiles[_loc3_].server == server_cacheID)
         {
            this.deleteProfile(this.__profiles[_loc3_]);
            this.__profiles[_loc3_] = null;
            delete this.__profiles[_loc3_];
         }
      }
   }
   function checkForTimeOut()
   {
      for(var _loc2_ in this.__profiles)
      {
         if(getTimer() - this.__profiles[_loc2_].lastAccess > this.__timeoutPeriod)
         {
            this.deleteProfile(this.__profiles[_loc2_]);
            this.__profiles[_loc2_] = null;
            delete this.__profiles[_loc2_];
         }
      }
   }
   function deleteProfile(p)
   {
      p.mc.removeMovieClip();
      false;
   }
   function callOnProfile(sID, method, dat)
   {
      for(var _loc3_ in this.__profiles)
      {
         if(this.__profiles[_loc3_].server == sID)
         {
            this.__profiles[_loc3_].mc.method(dat);
         }
      }
   }
}
