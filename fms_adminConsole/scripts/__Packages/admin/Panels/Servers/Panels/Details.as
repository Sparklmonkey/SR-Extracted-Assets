class admin.Panels.Servers.Panels.Details extends admin.panel
{
   var weekDays = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
   var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
   function Details()
   {
      super();
      this.__peaksServer = new Object();
      this.__peaksVHost = new Object();
      this.createEmptyMovieClip("backing",0);
      this.addControl("Label","lifeSpanLabel",4,{_x:450,_y:0,width:100,height:20,text:"Lifespan"});
      this.lifeSpanLabel.setFormat("bold",true);
      this.addControl("Label","uptimeLabel",5,{_x:450,_y:20,width:250,height:20,text:"-- : --"});
      this.addControl("Label","startedLabel",6,{_x:450,_y:40,width:250,height:20,text:"-- : --"});
      this.addControl("Label","timezoneLabel",7,{_x:500,_y:55,width:250,height:20,text:"-- : --"});
      this.addControl("Label","totalLabel",8,{_x:450,_y:70,width:250,height:20,text:"--"});
      this.addControl("Label","clientChartLabel",9,{_x:5,_y:70,width:250,height:15,text:"Active Connections",autoSize:"right"});
      this.clientChartLabel.setFormat("bold",true);
      this.addControl("Label","bandwidthChartLabel",10,{_x:5,_y:70,width:250,height:15,text:"Bandwidth",autoSize:"right"});
      this.bandwidthChartLabel.setFormat("bold",true);
      this.addControl("Label","cpuMemoryChartLabel",11,{_x:5,_y:70,width:250,height:15,text:"CPU and Memory Usage",autoSize:"right"});
      this.cpuMemoryChartLabel.setFormat("bold",true);
      this.addControl("ConnectionsChart","clientChart",12,{_x:5,_y:120});
      this.addControl("BandwidthChart","bandwidthChart",13,{_x:5,_y:260});
      this.addControl("LineChart","cpuMemoryChart",14,{_x:5,_y:400});
      this.cpuMemoryChart.setScaleUI(0,100,[0,50,100],[25,50,75]);
      this.cpuMemoryChart.registerProperty("cpu",6423648,"FMS CPU Usage (%) ");
      this.cpuMemoryChart.registerProperty("memory",16711680,"Memory (%) ");
      this.addControl("Label","msgBox",16,{_x:20,_y:0,width:350,height:15,text:"",autoSize:"left"});
      this.msgBox.setFormat("size",14);
      this.attachMovie("StatusBars","clientStatusBars",15);
      this.clientStatusBars._x = 15;
      this.clientStatusBars._y = 0;
      this.clientStatusBars.setSize(400,100);
      this.displayMessage(true,"Select a connected server ...");
   }
   function onChangeMode(evt)
   {
      this.owner.changeMode();
   }
   function setOwner(mc)
   {
      this.owner = mc;
   }
   function onActivate()
   {
      this.active = true;
      if(this.__node == undefined && this.owner.__currentNode != undefined)
      {
         this.__node = this.owner.__currentNode;
      }
      this.onSetServer(this.__node);
   }
   function onDeactivate()
   {
      this.active = false;
      this.deactivateDataProfile("ServerDetails",this.__oldNodeID,this.onNewData,this);
   }
   function firstDraw()
   {
      this.nextTab(this.clientStatusBars);
   }
   function onLogout()
   {
      this.clientChart.dump(null);
      this.bandwidthChart.dump(null);
      this.cpuMemoryChart.dump(null);
      this.clientStatusBars.clear();
   }
   function displayMessage(hide, msg)
   {
      this.lifeSpanLabel._visible = this.uptimeLabel._visible = this.startedLabel._visible = this.timezoneLabel._visible = this.totalLabel._visible = this.clientChartLabel._visible = this.bandwidthChartLabel._visible = this.cpuMemoryChartLabel._visible = this.clientChart._visible = this.bandwidthChart._visible = this.cpuMemoryChart._visible = this.clientStatusBars._visible = !hide;
      this.msgBox._visible = hide;
      this.msgBox.text = msg;
      this.owner.setTitle("","");
   }
   function onSetServer(node)
   {
      switch(node.type)
      {
         case "cluster":
            this.displayMessage(true,"You have a cluster selected. Please select a server.");
            break;
         case "server":
            if(node.connected)
            {
               this.displayMessage(false);
               this.deactivateDataProfile("ServerDetails",this.__oldNodeID,this.onNewData,this);
               this.__node = node;
               this.owner.setTitle(node.label," Details");
               this.clientStatusBars.clear();
               this.errorFlag = false;
               var _loc3_ = this.activateDataProfile("ServerDetails",this.__node.nodeid,this.onNewData,this);
               this.__oldNodeID = this.__node.nodeid;
               this.onRefresh();
            }
            break;
         case "vhost":
            if(node.parent.connected)
            {
               this.displayMessage(false);
               this.owner.setTitle(node.parent.label," Details");
            }
      }
   }
   function onForceRefresh()
   {
   }
   function onRefresh()
   {
      if(this.active)
      {
         if(this.__node != undefined)
         {
            this.__get__fc().call(this.__node.nodeid,"getServerStats",new this.ResBind(this.onServerStat,this,this.__node.nodeid,this.__node.label));
            var _loc6_ = this.__node.nodeid;
            var _loc3_ = 0;
            while(_loc3_ < this.__node.length)
            {
               var _loc4_ = this.__node.getTreeNodeAt(_loc3_);
               var _loc5_ = _global.conn.getFC(this.__node.nodeid).adminLevel.adaptor;
               this.__get__fc().call(this.__node.nodeid,"getVHostStats",new this.ResBind(this.onVHostStat,this,_loc4_.label,_loc6_),_loc5_,_loc4_.label);
               _loc3_ = _loc3_ + 1;
            }
         }
      }
   }
   function onServerStat(result, sID, label)
   {
      if(result.level == "status")
      {
         var _loc13_ = result.data;
         if(this.__peaksServer[sID] == undefined)
         {
            this.__peaksServer[sID] = result.data.io.connected;
         }
         if(result.data.io.connected > this.__peaksServer[sID])
         {
            this.__peaksServer[sID] = result.data.io.connected;
         }
         this.clientStatusBars.updateServer(sID,label,result.data.io.connected,this.__peaksServer[sID]);
         this.totalLabel.text = "Total Clients: " + _loc13_.io.total_connects;
         var _loc10_ = _loc13_.uptime;
         var _loc3_ = Math.floor(_loc10_ / 60);
         var _loc4_ = Math.floor(_loc3_ / 60);
         var _loc5_ = Math.floor(_loc4_ / 24);
         var _loc8_ = undefined;
         var _loc11_ = "seconds";
         if(_loc10_ == 1)
         {
            _loc11_ = "second";
         }
         if(_loc3_ >= 1)
         {
            _loc11_ = "s";
            var _loc12_ = "minutes";
            if(_loc3_ == 1)
            {
               _loc12_ = "minute";
            }
            if(_loc4_ >= 1)
            {
               _loc12_ = "m";
               var _loc6_ = "hours";
               if(_loc4_ == 1)
               {
                  _loc6_ = "hour";
               }
               if(_loc5_ >= 1)
               {
                  _loc6_ = "h";
                  var _loc15_ = "days";
                  if(_loc5_ == 1)
                  {
                     _loc15_ = "day";
                  }
                  _loc8_ = _loc5_ + " " + _loc15_ + " " + (_loc4_ - _loc5_ * 24) + _loc6_;
               }
               else
               {
                  _loc8_ = _loc4_ + " " + _loc6_ + " " + (_loc3_ - _loc4_ * 60) + _loc12_;
               }
            }
            else
            {
               _loc8_ = _loc3_ + " " + _loc12_ + " " + (_loc10_ - _loc3_ * 60) + _loc11_;
            }
         }
         else
         {
            _loc8_ = _loc10_ + " " + _loc11_;
         }
         this.uptimeLabel.text = "Uptime: " + _loc8_;
         var _loc2_ = _loc13_.launchTime;
         this.startedLabel.text = "Started: " + this.weekDays[_loc2_.getDay()] + ", " + this.months[_loc2_.getMonth()] + " " + _loc2_.getDate();
         var _loc14_ = this.getHoursAmPm(_loc2_.getHours());
         var _loc17_ = _loc2_.getHours() <= _loc2_.getUTCHours() ? _loc2_.getHours() - _loc2_.getUTCHours() - 1 : _loc2_.getHours() - 24 - _loc2_.getUTCHours() - 1;
         this.timezoneLabel.text = _loc14_.hours + ":" + this.padTime(_loc2_.getMinutes()) + _loc14_.ampm.toLowerCase() + " " + this.getTimezone(_loc2_);
      }
      else if(!this.errorFlag)
      {
         this.onError("Error requesting stats from the server " + label);
         this.uptimeLabel.text = "-- : --";
         this.startedLabel.text = "-- : --";
         this.timezoneLabel.text = "-- : --";
         this.totalLabel.text = "--";
         this.errorFlag = true;
      }
   }
   function onVHostStat(result, vhostName, serverID)
   {
      if(result.level == "status")
      {
         var _loc2_ = serverID + vhostName;
         if(this.__peaksVHost[_loc2_] == undefined)
         {
            this.__peaksVHost[_loc2_] = result.data.connected;
         }
         if(result.data.connected > this.__peaksVHost[_loc2_])
         {
            this.__peaksVHost[_loc2_] = result.data.connected;
         }
         this.clientStatusBars.updateVhost(vhostName,result.data.connected,this.__peaksVHost[_loc2_]);
      }
      else if(!this.errorFlag)
      {
         this.onError("Error in retrieving stats from vHost " + vhostName);
         this.errorFlag = true;
      }
   }
   function onNewData(data)
   {
      this[data.method](data);
   }
   function onHistory(data)
   {
      this.clientChart.clear();
      this.clientChart.dump(data.data_1);
      this.bandwidthChart.clear();
      this.bandwidthChart.dump(data.data_2);
      this.cpuMemoryChart.clear();
      this.cpuMemoryChart.dump(data.data_3);
   }
   function onChartPush(data)
   {
      this.clientChart.push(data.data.c1);
      this.bandwidthChart.push(data.data.c2);
      this.cpuMemoryChart.push(data.data.c3);
   }
   function padTime(n)
   {
      if(n.toString().length == 1)
      {
         return "0" + n;
      }
      return n.toString();
   }
   function getHoursAmPm(hour24)
   {
      var _loc3_ = new Object();
      _loc3_.ampm = hour24 >= 12 ? "PM" : "AM";
      var _loc2_ = hour24 % 12;
      if(_loc2_ == 0)
      {
         _loc2_ = 12;
      }
      _loc3_.hours = this.padTime(_loc2_);
      return _loc3_;
   }
   function getTimezone(date)
   {
      var _loc1_ = date.toString();
      var _loc3_ = _loc1_.split(" ");
      _loc1_ = _loc3_[4];
      var _loc2_ = _loc1_.indexOf("+");
      if(_loc2_ == -1)
      {
         _loc2_ = _loc1_.indexOf("-");
      }
      return _loc1_.slice(0,4) + Number(_loc1_.slice(5)) / 100;
   }
   function setSize(w, h)
   {
      this.backing.clear();
      var _loc2_ = (h - 110) / 3;
      var _loc4_ = _loc2_ - 20;
      this.clientChart.setSize(w - 10,_loc4_);
      this.bandwidthChart.setSize(w - 10,_loc4_);
      this.bandwidthChart._y = 100 + _loc2_ + 20;
      this.cpuMemoryChart.setSize(w - 10,_loc4_);
      this.cpuMemoryChart._y = 100 + 2 * _loc2_ + 20;
      this.clientChartLabel._y = 100;
      this.bandwidthChartLabel._y = 100 + _loc2_;
      this.cpuMemoryChartLabel._y = 100 + 2 * _loc2_;
      this.clientChartLabel._x = w - this.clientChartLabel.width - 5;
      this.bandwidthChartLabel._x = w - this.bandwidthChartLabel.width - 5;
      this.cpuMemoryChartLabel._x = w - this.cpuMemoryChartLabel.width - 5;
   }
}
