class admin.general.connection extends admin.general.FCSEngine
{
   var randomNums = 0;
   function connection()
   {
      super();
      _global.conn = this;
      this.conList = new Array();
      this.sStrings = new Object();
      this.__fcct = new admin.general.FCSContext();
      this.__cache = new admin.general.Cache();
      this.__cons = new Object();
      this.debugCons = new Object();
      this.debugQues = new Array();
      this.justBornQues = new Array();
      setInterval(this.debugInterval,1000,this);
      this.cm = new admin.general.clusterManager(this.__cache);
      this.cm.connection = this;
      this.cm.owner = this;
   }
   function requestOpenServer(id, data, stat)
   {
      this.sStrings[id] = data.server;
      if(!this.__cons[id])
      {
         this.__cons[id] = new admin.general.clusterObjects.trueConnection(id,data,this,stat);
      }
      else
      {
         this.__cons[id].onStatus2 = stat;
         this.__cons[id].reconnect(data);
      }
      return this.__cons[id];
   }
   function disposeConnection(id)
   {
      this.__cons[id].close();
      _global.dat_c.flushProfiles(id);
      delete this.__cons[id];
      if((this.conList.toString() + ",").indexOf(id + ",") != -1)
      {
         var _loc3_ = 0;
         while(_loc3_ < this.conList.length)
         {
            if(this.conList[_loc3_] == id)
            {
               this.conList.splice(_loc3_,1);
               break;
            }
            _loc3_ = _loc3_ + 1;
         }
      }
      this.refreshCons();
   }
   function disposeAll()
   {
      for(var _loc2_ in this.__cons)
      {
         this.disposeConnection(_loc2_);
      }
      for(_loc2_ in this.debugCons)
      {
         this.debugCons[_loc2_].close();
         delete this.debugCons[_loc2_];
      }
   }
   function setServerStatus(id, connected)
   {
      if(connected == true)
      {
         if((this.conList.toString() + ",").indexOf(id + ",") == -1)
         {
            this.conList.push(id);
         }
         this.refreshCons();
      }
      else
      {
         if((this.conList.toString() + ",").indexOf(id + ",") != -1)
         {
            var _loc3_ = 0;
            while(_loc3_ < this.conList.length)
            {
               if(this.conList[_loc3_] == id)
               {
                  this.conList.splice(_loc3_,1);
                  break;
               }
               _loc3_ = _loc3_ + 1;
            }
         }
         this.refreshCons();
      }
      _global.cm.setServerStatus(id,connected);
   }
   function refreshCons()
   {
      if(this.conList.length == 0)
      {
         _global.li_hb.light.gotoAndStop(1);
      }
      else
      {
         _global.li_hb.light.gotoAndStop(2);
      }
   }
   function call(id)
   {
      var _loc4_ = new Array();
      var _loc3_ = 1;
      while(_loc3_ < arguments.length)
      {
         _loc4_.push(arguments[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
      this.__cons[id].call.apply(this.__cons[id],_loc4_);
   }
   function getFC(id)
   {
      return this.__cons[id];
   }
   function inDebug(__sID, app)
   {
      if(this.debugCons[__sID + app])
      {
         return this.debugCons[__sID + app].isConnected;
      }
      return false;
   }
   function enterDebugMode(__sID, app, cb, ct)
   {
      var _loc5_ = new Array();
      var _loc3_ = 4;
      while(_loc3_ < arguments.length)
      {
         _loc5_.push(arguments[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
      if(this.debugCons[__sID + app] && this.debugCons[__sID + app].isConnected)
      {
         _loc5_.unshift(this.debugCons[__sID + app]);
         cb.apply(ct,_loc5_);
      }
      var _loc4_ = this.sStrings[__sID];
      var _loc9_ = "rtmp";
      var _loc7_ = _loc4_.indexOf("://");
      if(_loc7_ != -1)
      {
         _loc9_ = _loc4_.slice(0,_loc7_);
         _loc4_ = _loc4_.slice(_loc7_ + 3,_loc4_.length);
      }
      _loc4_ += ":";
      var _loc8_ = _loc4_.slice(0,_loc4_.indexOf(":"));
      this.debugCons[__sID + app].close();
      delete this.debugCons[__sID + app];
      var _loc11_ = new admin.general.debugConnection();
      this.debugCons[__sID + app] = _loc11_;
      _loc11_.connection = this;
      var _loc12_ = this.getDebugID(__sID);
      _loc11_.nID = _loc12_;
      var _loc10_ = "rtmp://" + _loc8_ + "/" + app + "?_fcs_debugreq_=" + _loc12_;
      _loc11_.connect(_loc10_);
      this.debugQues.push({app:app,nID:_loc12_,sID:__sID,cb:cb,ct:ct,args:_loc5_,nc:_loc11_});
      return _loc11_;
   }
   function removeFromQue(nID, dbc)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.debugQues.length)
      {
         var _loc3_ = this.debugQues[_loc2_];
         if(_loc3_.nID == nID)
         {
            this.justBornQues.push(_loc3_);
            this.debugQues.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function allowCalls(nID, dbc)
   {
      var _loc3_ = 0;
      while(_loc3_ < this.justBornQues.length)
      {
         var _loc2_ = this.justBornQues[_loc3_];
         if(_loc2_.nID == nID)
         {
            _loc2_.args.unshift(dbc);
            _loc2_.cb.apply(_loc2_.ct,_loc2_.args);
            this.justBornQues.splice(_loc3_,1);
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function killDebug(__sID, app)
   {
      this.debugCons[__sID + app].close();
      delete this.debugCons[__sID + app];
   }
   function workDebugConns()
   {
      var _loc3_ = 0;
      while(_loc3_ < this.debugQues.length)
      {
         var _loc2_ = this.debugQues[_loc3_];
         this.call(_loc2_.sID,"approveDebugSession",null,_loc2_.app,_loc2_.nID);
         this.removeFromQue(_loc2_.nID,_loc2_.nc);
         _loc3_ = _loc3_ + 1;
      }
   }
   function debugInterval(ct)
   {
      ct.workDebugConns();
   }
   function getDebugID(sID)
   {
      var _loc2_ = this.getFC(sID);
      var _loc3_ = _loc2_.connTime.getHours().toString() + _loc2_.connTime.getMinutes().toString() + _loc2_.connTime.getSeconds().toString();
      _loc3_ += this.randomNums.toString();
      if(_loc2_.connTime.getHours() <= 9)
      {
         _loc3_ += random(9).toString();
      }
      this.randomNums = this.randomNums + 1;
      return Number(_loc3_);
   }
}
