class admin.general.clusterManager extends UI.core.events
{
   var connectCount = 0;
   function clusterManager(__cache)
   {
      super();
      _global.cm = this;
      this.cache = __cache;
      this.conStat = new Object();
      this.tempPromtRes = new Object();
      var _loc4_ = this.newClusterObject("def","def",null);
      this.store = this.cache.getProp("cm_store",{clusters:{def:_loc4_},cc:0,sc:0});
      this.cb = new Object();
      this.quePool = new Object();
      this.blockFocus();
   }
   function logoff()
   {
   }
   function init()
   {
      var _loc4_ = new Object();
      _loc4_.conList = new Array();
      _loc4_.cc = new Object();
      for(var _loc5_ in this.store.clusters)
      {
         var _loc3_ = this.getCluster(_loc5_);
         if(_loc3_.auto == true)
         {
            _loc4_.conList.push(_loc5_);
         }
         else
         {
            for(var _loc12_ in _loc3_.servers)
            {
               if(_loc3_.servers[_loc12_].dl.auto == true)
               {
                  _loc4_.conList.push({id:_loc12_,cluster:_loc3_.label,type:1});
                  if(!_loc4_.cc[_loc3_.label])
                  {
                     _loc4_.cc[_loc3_.label] = new Object({t:0,i:1});
                  }
                  _loc4_.cc[_loc3_.label].t = _loc4_.cc[_loc3_.label].t + 1;
               }
            }
         }
      }
      var _loc9_ = _global.l_cache.getProp("singletonServers",new Array(new Object({label:"Server 1"})));
      if(_loc9_.length > 0)
      {
         _loc5_ = 0;
         while(_loc5_ < _loc9_.length)
         {
            if(_loc9_[_loc5_].auto == true)
            {
               _loc4_.conList.push({id:"a" + _loc5_,server:_loc9_[_loc5_].label});
            }
            _loc5_ = _loc5_ + 1;
         }
      }
      if(_loc4_.conList.length > 0)
      {
         _global.autoOn = true;
         this.processAuto(null,_loc4_);
      }
      else
      {
         false;
      }
   }
   function processAuto(dat, o)
   {
      if(o.conList.length > 0)
      {
         var _loc4_ = o.conList[0];
         var _loc5_ = _loc4_.id;
         _global.li_hb.setLoginText("Connecting to server [" + _loc4_.server + "]","");
         o.conList.splice(0,1);
         this.connect(_loc5_,this.processAuto,this,o);
      }
      else
      {
         _global.autoOn = false;
         _global.lf.onConnect();
      }
   }
   function getConnectedList()
   {
      var _loc2_ = new Array();
      for(var _loc3_ in this.conStat)
      {
         if(this.conStat[_loc3_] == true)
         {
            _loc2_.push(_loc3_);
         }
      }
      return _loc2_;
   }
   function isConnected(id)
   {
      return this.conStat[id];
   }
   function getServersGroup(sID)
   {
      for(var _loc3_ in this.store.clusters)
      {
         if(this.store.clusters[_loc3_].servers[sID])
         {
            return _loc3_;
         }
      }
   }
   function workSingle(q, form)
   {
      form.closeForm();
      if(q.promt == true)
      {
         var _loc3_ = _global.form_manager.onAlert("Form_singleton",350,238,"",this);
         _loc3_.setType(0);
         _loc3_.onQueData(q);
      }
      else
      {
         this.connection.requestOpenServer(q.id,q);
      }
   }
   function connect(id, res, ct, dat)
   {
      if(id.indexOf("a") != -1)
      {
         var _loc10_ = _global.l_cache.getProp("singletonServers");
         var _loc9_ = Number(id.slice(1,id.length));
         dat = _loc10_[_loc9_];
         var _loc11_ = this.connectCount;
         this.connectCount = this.connectCount + 1;
         var _loc3_ = new Object();
         this.quePool[_loc11_] = _loc3_;
         _loc3_.type = 1;
         _loc3_.id = id;
         _loc3_.n = _loc9_;
         _loc3_.ct = ct;
         _loc3_.res = res;
         _loc3_.dat = dat;
         _loc3_.datHold = new Object();
         _loc3_.conTest = new Object();
         _loc3_.conTest[id] = true;
         _loc3_.conTest.length = 1;
         _loc3_.user = dat.user;
         _loc3_.pass = dat.pass;
         _loc3_.server = dat.server;
         if(!dat.pass)
         {
            _loc3_.promt = true;
         }
         _loc3_.rememberPass = dat.rememberPass;
         this.workSingle(_loc3_);
      }
      else
      {
         _loc11_ = this.connectCount;
         this.connectCount = this.connectCount + 1;
         _loc3_ = new Object();
         this.quePool[_loc11_] = _loc3_;
         _loc3_.connQue = new Array();
         _loc3_.cQues = new Array();
         _loc3_.sQues = new Array();
         _loc3_.cID = id;
         _loc3_.res = res;
         _loc3_.ct = ct;
         _loc3_.dat = dat;
         _loc3_.datHold = new Object();
         _loc3_.result = new Object();
         _loc3_.result.connected = new Array();
         _loc3_.result.lost = new Array();
         if(id.charAt(0) == "c")
         {
            var _loc6_ = this.store.clusters[id].servers;
            var _loc14_ = false;
            _loc3_.user = this.store.clusters[id].dl.user;
            _loc3_.pass = this.store.clusters[id].dl.pass;
            _loc3_.rememberPass = this.store.clusters[id].dl.rememberPass;
            for(var _loc8_ in _loc6_)
            {
               if(this.isConnected(_loc8_) == true)
               {
                  _loc3_.result.connected.push(_loc8_);
               }
               else
               {
                  var _loc7_ = this.getServerConnMethod(_loc8_);
                  if(_loc7_.mode == 0)
                  {
                     _loc3_.sQues.push(_loc7_);
                  }
                  else if(_loc7_.mode == 2)
                  {
                     _loc3_.cQues.push(_loc7_);
                  }
                  else
                  {
                     _loc3_.connQue.push(_loc7_);
                  }
               }
            }
         }
         else
         {
            _loc7_ = this.getServerConnMethod(id);
            if(_loc7_.mode == 0)
            {
               _loc3_.sQues.push(_loc7_);
            }
            else if(_loc7_.mode == 2)
            {
               _loc3_.cQues.push(_loc7_);
            }
            else
            {
               _loc3_.connQue.push(_loc7_);
            }
            _loc3_.cID = this.getServersGroup(id);
         }
         this.workQue(_loc3_);
      }
   }
   function workQue(q, form)
   {
      form.closeForm();
      if(q.cQues.length > 0)
      {
         this.quePromt({type:0,q:q});
      }
      else if(q.sQues.length > 0)
      {
         this.quePromt({type:1,q:q});
      }
      else if(q.connQue.length == 0)
      {
         this.resultQue(q);
      }
      else
      {
         this.connectQue(q);
      }
   }
   function resultQue(q, form)
   {
      form.closeForm();
      delete q.connQue;
      delete q.cQues;
      delete q.sQues;
      delete q.cID;
      delete q.conTest;
      var _loc3_ = new Array();
      _loc3_.push(q.result);
      _loc3_.push(q.dat);
      q.res.apply(q.ct,_loc3_);
      if(form == undefined)
      {
         this.dispatchEvent("change",{target:this});
      }
   }
   function connectQue(q)
   {
      q.conTest = new Object();
      q.conTest.length = 0;
      var _loc4_ = 0;
      while(_loc4_ < q.connQue.length)
      {
         var _loc2_ = q.connQue[0];
         q.conTest[_loc2_.id] = true;
         q.conTest.length = q.conTest.length + 1;
         q.datHold[_loc2_.id] = _loc2_;
         this.connection.requestOpenServer(_loc2_.id,_loc2_);
         q.connQue.splice(0,1);
         _loc4_ = _loc4_ + 1;
      }
   }
   function quePromt(data)
   {
      if(data.type != 0)
      {
         var _loc4_ = _global.form_manager.onAlert("Form_singleton",350,260,"",this);
         _loc4_.onQueData(data.q,this.getCluster(data.q.cID).servers[data.q.sQues[0].id],data);
      }
   }
   function getServerConnMethod(sID)
   {
      var _loc5_ = this.getServersGroup(sID);
      var _loc2_ = this.store.clusters[_loc5_].servers[sID].dl;
      var _loc4_ = this.store.clusters[_loc5_].dl;
      if(_loc2_.promt == true)
      {
         return {mode:0,server:_loc2_.server,id:sID};
      }
      if(_loc2_.user && _loc2_.pass)
      {
         return {mode:1,user:_loc2_.user,pass:_loc2_.pass,server:_loc2_.server,id:sID};
      }
      if(!_loc4_.pass)
      {
         return {mode:2,server:_loc2_.server,id:sID};
      }
      return {mode:3,server:_loc2_.server,user:_loc4_.user,pass:_loc4_.pass,id:sID};
   }
   function updateQue(id, con, q)
   {
      q.conTest.length--;
      if(id != false)
      {
         if(con == true)
         {
            q.result.connected.push(id);
         }
         else
         {
            q.result.lost.push(id);
         }
      }
      if(q.conTest.length == 0)
      {
         if(id.indexOf("a") != -1)
         {
            this.resultQue(q);
         }
         else if(q.sQues.length != 0)
         {
            this.workQue(q);
         }
         else
         {
            this.resultQue(q);
         }
      }
   }
   function setServerStatus(id, connected)
   {
      this.conStat[id] = connected;
      var _loc4_ = undefined;
      for(var _loc5_ in this.quePool)
      {
         var _loc3_ = this.quePool[_loc5_];
         if(_loc3_.conTest[id] == true)
         {
            _loc4_ = _loc3_;
         }
      }
      if(connected == true)
      {
         delete _loc4_.conTest[id];
         this.updateQue(id,connected,_loc4_);
      }
      else if(_loc4_ != undefined)
      {
         if(id.indexOf("a") != -1)
         {
            var _loc7_ = _global.form_manager.onAlert("Form_singleton",350,238,"",this);
            _loc7_.setType(1);
            _loc7_.onQueData(_loc4_);
         }
         else
         {
            _loc4_.sQues.push(_loc4_.datHold[id]);
            _loc4_.conTest[id] = null;
            delete _loc4_.conTest[id];
            this.updateQue(false,connected,_loc4_);
         }
      }
      else if(id.indexOf("a") != -1)
      {
         var _loc9_ = _global.l_cache.getProp("singletonServers");
         id = Number(id.slice(1,id.length));
         if(_global.groupManager.currentScreen != "Login")
         {
            this.onError("Lost connection: " + _loc9_[id].label);
         }
      }
      else if(_global.groupManager.currentScreen != "Login")
      {
         this.onError("Lost connection: " + this.getCluster(this.getServersGroup(id)).servers[id].label);
      }
      this.dispatchEvent("change",{target:this});
   }
   function showBadInfoPromt(id, cID)
   {
      this.openPromt = true;
      var _loc4_ = _global.form_manager.onAlert("Form_badInfo",310,365,"Verify Details",this);
      cID = this.getServersGroup(id);
      _loc4_.setContext(id,cID,this.store.clusters[cID]);
   }
   function onIgnore(sID)
   {
      for(var _loc9_ in this.conQue)
      {
         var _loc2_ = this.conQue[_loc9_];
         if(_loc2_.servers[sID] == 0)
         {
            _loc2_.sLen = _loc2_.sLen - 1;
            _loc2_.lost.push(sID);
         }
         if(_loc2_.sLen == 0)
         {
            var _loc3_ = new Array();
            _loc3_.push({lost:_loc2_.lost});
            var _loc4_ = _loc2_.res.apply(_loc2_.ct,_loc3_);
            if(_loc4_ == false)
            {
               for(var _loc8_ in _loc2_.servers)
               {
                  this.conStat[_loc8_] = false;
                  this.connection.disposeConnection(_loc8_);
               }
            }
            this.dispatchEvent("change",{target:this});
            delete this.conQue[_loc9_];
         }
      }
   }
   function processSingleConnect(sID, dl)
   {
      this.connection.requestOpenServer(sID,dl);
   }
   function addCluster(label, data)
   {
      var _loc2_ = "c" + this.store.cc;
      this.store.cc = this.store.cc + 1;
      this.store.clusters[_loc2_] = this.newClusterObject(_loc2_,label,data);
      this.update();
      return _loc2_;
   }
   function getCluster(id)
   {
      return this.store.clusters[id];
   }
   function addServer(clusterID, nodeID, data)
   {
      this.store.sc = this.store.sc + 1;
      var _loc10_ = "s" + this.store.sc;
      var _loc8_ = new Object();
      var _loc6_ = _global.l_cache.getProp("singletonServers");
      var _loc5_ = Number(nodeID.slice(1,nodeID.length));
      var _loc9_ = _loc6_[_loc5_];
      var _loc11_ = "Server ";
      var _loc7_ = 0;
      var _loc4_ = 0;
      while(_loc4_ < _loc6_.length)
      {
         var _loc3_ = _loc6_[_loc4_].label;
         if(_loc3_.slice(0,7) == "Server ")
         {
            _loc5_ = Number(_loc3_.slice(7,_loc3_.length));
            if(_loc5_ != NaN && _loc5_ > _loc7_)
            {
               _loc7_ = Number(_loc3_.slice(7,_loc3_.length));
            }
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc11_ += (_loc7_ + 1).toString();
      _loc8_.label = _loc11_;
      _loc8_.user = _loc9_.user;
      _loc8_.server = _loc9_.server;
      _loc8_.auto = false;
      _loc8_.pass = _loc9_.pass;
      _loc6_.push(_loc8_);
      _global.l_cache.setProp("singletonServers",_loc6_);
      this.onServerTest(_loc10_,true,data,clusterID);
      this.update();
      return _loc10_;
   }
   function onServerTest(id, test, data, cID)
   {
      if(test == true)
      {
         var _loc2_ = this.getCluster(cID);
         _loc2_.servers[id] = {dl:data,label:data.label};
         delete data.label;
         this.update();
      }
   }
   function newClusterObject(id, label, liSettings)
   {
      var _loc1_ = {label:label,dl:liSettings,servers:new Object()};
      return _loc1_;
   }
   function removeCluster(clusterID)
   {
      var _loc3_ = this.getCluster(clusterID);
      for(var _loc4_ in _loc3_.servers)
      {
         _global.conn.disposeConnection(_loc4_);
      }
      delete this.store.clusters[clusterID];
      this.update();
   }
   function removeServer(sID)
   {
      _global.conn.disposeConnection(sID);
      if(sID.indexOf("a") != -1)
      {
         var _loc4_ = _global.l_cache.getProp("singletonServers");
         var _loc6_ = Number(sID.slice(1,sID.length));
         _loc4_.splice(_loc6_,1);
         _global.l_cache.setProp("singletonServers",_loc4_);
         this.update();
      }
      else
      {
         var _loc7_ = this.getServersGroup(sID);
         var _loc5_ = this.getCluster(_loc7_);
         delete _loc5_.servers[sID];
         this.update();
      }
   }
   function getClusterList()
   {
      var _loc2_ = new Array();
      for(var _loc3_ in this.store.clusters)
      {
         if(_loc3_ != "def")
         {
            _loc2_.push(_loc3_);
         }
      }
      return _loc2_;
   }
   function onGetVhosts_Single(result, res, resM, ct)
   {
      res.vHosts = result.data;
      var _loc1_ = new Array();
      _loc1_.push(res);
      resM.apply(ct,_loc1_);
   }
   function §get§(cID, resM, ct, dataObj)
   {
      if(cID.indexOf("a") != -1)
      {
         var _loc14_ = _global.conn.getFC(cID);
         var _loc19_ = _global.l_cache.getProp("singletonServers");
         var _loc16_ = Number(cID.slice(1,cID.length));
         var _loc15_ = {data:dataObj,cID:cID,label:_loc19_[_loc16_].label,server:_loc19_[_loc16_].label,connected:_loc14_.isConnected,vHosts:new Array(),sID:cID};
         if(_loc14_.isConnected == true && _loc14_.adminLevel.admin_type != "vhost")
         {
            _loc14_.call("getVHosts",new this.ResBind(this.onGetVhosts_Single,this,_loc15_,resM,ct));
         }
         else
         {
            if(_loc14_.adminLevel.admin_type == "vhost")
            {
               _loc15_.vHosts = new Array();
               _loc15_.vHosts.push(_loc14_.adminLevel.vhost);
            }
            var _loc18_ = new Array();
            _loc18_.push(_loc15_);
            resM.apply(ct,_loc18_);
         }
      }
      else
      {
         var _loc20_ = this.store.clusters[cID];
         var _loc3_ = _loc20_.servers;
         var _loc4_ = new Object();
         _loc4_.cID = cID;
         _loc4_.servers = new Array();
         _loc4_.queList = 0;
         _loc4_.data = dataObj;
         _loc4_.label = _loc20_.label;
         var _loc12_ = true;
         for(_loc16_ in _loc3_)
         {
            if(this.conStat[_loc16_] == true && _global.conn.getFC(_loc16_).adminLevel.admin_type != "vhost")
            {
               _loc4_.queList = _loc4_.queList + 1;
               _loc12_ = false;
               this.connection.call(_loc16_,"getVHosts",new this.ResBind(this.onGetVHosts,this,_loc4_,_loc16_,resM,ct,_loc3_[_loc16_].dl.server,_loc3_[_loc16_].label));
            }
            else
            {
               var _loc7_ = new Array();
               var _loc5_ = false;
               if(_global.conn.getFC(_loc16_).adminLevel.admin_type == "vhost")
               {
                  _loc7_.push(_global.conn.getFC(_loc16_).adminLevel.vhost);
                  _loc5_ = true;
               }
               _loc4_.servers.push({connected:_loc5_,server:_loc3_[_loc16_].dl.server,label:_loc3_[_loc16_].label,sID:_loc16_,vHosts:_loc7_});
            }
         }
         if(_loc12_ == true)
         {
            delete _loc4_.queList;
            _loc18_ = new Array();
            _loc18_.push(_loc4_);
            resM.apply(ct,_loc18_);
         }
      }
   }
   function onGetVHosts(result, res, sID, resM, ct, server, label)
   {
      res.queList = res.queList - 1;
      res.servers.push({connected:true,server:server,vHosts:result.data,label:label,sID:sID});
      if(res.queList == 0)
      {
         delete res.queList;
         var _loc2_ = new Array();
         _loc2_.push(res);
         resM.apply(ct,_loc2_);
      }
   }
   function update()
   {
      this.cache.setProp("cm_store",this.store);
      this.dispatchEvent("change",{target:this});
   }
}
