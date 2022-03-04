class admin.Panels.Application.Panels.Performance extends admin.panel
{
   var weekDays = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
   var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
   function Performance()
   {
      super();
      this.addControl("Label","l1",0,{_x:12,_y:11,width:100,height:20,text:"Clients"});
      this.l1.setFormat("bold",true);
      this.addControl("Label","l2",1,{_x:14,_y:30,width:100,height:20,text:"Total:"});
      this.addControl("Label","l3",2,{_x:14,_y:45,width:100,height:20,text:"Active:"});
      this.addControl("Label","l4",3,{_x:14,_y:60,width:100,height:20,text:"Rejected:"});
      this.addControl("Label","v1",4,{_x:74,_y:30,width:200,height:20,text:"- -"});
      this.addControl("Label","v2",5,{_x:74,_y:45,width:200,height:20,text:"- -"});
      this.addControl("Label","v3",6,{_x:74,_y:60,width:200,height:20,text:"- -"});
      this.addControl("Label","l5",7,{_x:132,_y:11,width:100,height:20,text:"Lifespan"});
      this.l5.setFormat("bold",true);
      this.addControl("Label","v4",8,{_x:134,_y:30,width:200,height:20,text:"Uptime: - -"});
      this.addControl("Label","v5",9,{_x:134,_y:45,width:200,height:20,text:"Started: - -"});
      this.addControl("Label","v6",10,{_x:184,_y:60,width:200,height:20,text:""});
      this.addControl("ProgressBar","pb1",11,{_x:350,_y:31,width:135,height:4});
      this.addControl("Label","l6",12,{_x:322,_y:11,width:200,height:20,text:"Messages Per Second"});
      this.l6.setFormat("bold",true);
      this.addControl("Label","v7",13,{_x:322,_y:23,width:100,height:20,text:"In"});
      this.addControl("Label","v8",14,{_x:488,_y:23,width:100,height:20,text:"Out"});
      this.addControl("Label","v9",15,{_x:349,_y:32,width:100,height:20,text:"0"});
      this.addControl("Label","v10",16,{_x:474,_y:32,width:100,height:20,text:"0",autoSize:"left"});
      this.addControl("ProgressBar","pb2",17,{_x:350,_y:71,width:135,height:4});
      this.addControl("Label","l7",18,{_x:322,_y:51,width:200,height:20,text:"Bytes Per Second"});
      this.l7.setFormat("bold",true);
      this.addControl("Label","v11",19,{_x:322,_y:63,width:100,height:20,text:"In"});
      this.addControl("Label","v12",20,{_x:488,_y:63,width:100,height:20,text:"Out"});
      this.addControl("Label","v13",21,{_x:349,_y:72,width:100,height:20,text:"0"});
      this.addControl("Label","v14",22,{_x:474,_y:72,width:100,height:20,text:"0",autoSize:"left"});
      this.addControl("ConnectionsChart","chart1",23,{_x:5,_y:100});
      this.addControl("BandwidthChart","chart2",24,{_x:5,_y:260});
      this.addControl("LineChart","chart3",25,{_x:5,_y:400});
      this.chart3.setScaleUI(0,100,[0,50,100],[25,50,75]);
      this.chart3.registerProperty("cpu",6423648,"FMS CPU (% of total) ");
      this.chart3.registerProperty("memory",16711680,"Memory (% of total) ");
      this.addControl("Label","clientChartLabel",26,{_x:5,_y:70,width:250,height:15,text:"Active Connections",autoSize:"right"});
      this.clientChartLabel.setFormat("bold",true);
      this.addControl("Label","bandwidthChartLabel",27,{_x:5,_y:70,width:250,height:15,text:"Bandwidth",autoSize:"right"});
      this.bandwidthChartLabel.setFormat("bold",true);
      this.addControl("Label","cpuMemoryChartLabel",28,{_x:5,_y:70,width:250,height:15,text:"CPU and Memory Usage",autoSize:"right"});
      this.cpuMemoryChartLabel.setFormat("bold",true);
      this.history = new Object();
   }
   function onActivate()
   {
      this.onSetServer(this.owner.__server);
      this.onSetApp(this.owner.selectedApplication);
   }
   function onDeactivate()
   {
      this.deactivateDataProfile("AppsPerformance",this.__server,this.onNewData,this);
   }
   function onRefresh()
   {
   }
   function onLogout()
   {
      this.chart1.clear();
      this.chart1.dump(null);
      this.chart2.clear();
      this.chart2.dump(null);
      this.chart3.clear();
      this.chart3.dump(null);
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
   function onSetServer(id)
   {
      this.deactivateDataProfile("AppsPerformance",this.__server,this.onNewData,this);
      this.__server = id;
      var _loc2_ = this.activateDataProfile("AppsPerformance",id,this.onNewData,this);
      this.onRefresh();
   }
   function onNewData(data)
   {
      this[data.method](data);
   }
   function onHistory(data)
   {
      this.chart1.clear();
      this.chart1.dump(data.data_1);
      this.chart2.clear();
      this.chart2.dump(data.data_2);
      this.chart3.clear();
      this.chart3.dump(data.data_3);
   }
   function onChartPush(data)
   {
      this.chart1.push(data.data.c1);
      this.chart2.push(data.data.c2);
      this.chart3.push(data.data.c3);
   }
   function onInstStat(result)
   {
      var _loc6_ = 0;
      if(this.prior_time > 0)
      {
         _loc6_ = getTimer() / 1000 - this.priorTime;
      }
      this.priorTime = getTimer() / 1000;
      if(result.level == "status")
      {
         var _loc2_ = result.data;
         this.v1.text = _loc2_.total_connects;
         this.v2.text = _loc2_.connected;
         this.v3.text = _loc2_.rejected;
         var _loc9_ = _loc2_.up_time;
         var _loc4_ = Math.floor(_loc9_ / 60);
         var _loc5_ = Math.floor(_loc4_ / 60);
         var _loc7_ = Math.floor(_loc5_ / 24);
         var _loc8_ = undefined;
         var _loc13_ = "seconds";
         if(_loc9_ == 1)
         {
            _loc13_ = "second";
         }
         if(_loc4_ >= 1)
         {
            var _loc14_ = "minutes";
            if(_loc4_ == 1)
            {
               _loc14_ = "minute";
            }
            if(_loc5_ >= 1)
            {
               var _loc10_ = "hours";
               if(_loc5_ == 1)
               {
                  _loc10_ = "hour";
               }
               if(_loc7_ >= 1)
               {
                  var _loc18_ = "days";
                  if(_loc7_ == 1)
                  {
                     _loc18_ = "day";
                  }
                  _loc8_ = _loc7_ + " " + _loc18_ + " " + (_loc5_ - _loc7_ * 24) + " " + _loc10_;
               }
               else
               {
                  _loc8_ = _loc5_ + " " + _loc10_ + " " + (_loc4_ - _loc5_ * 60) + " " + _loc14_;
               }
            }
            else
            {
               _loc8_ = _loc4_ + " " + _loc14_ + " " + (_loc9_ - _loc4_ * 60) + " " + _loc13_;
            }
         }
         else
         {
            _loc8_ = _loc9_ + " " + _loc13_;
         }
         this.v4.text = "Uptime: " + _loc8_;
         var _loc3_ = _loc2_.launch_time;
         this.v5.text = "Started: " + this.weekDays[_loc3_.getDay()] + ", " + this.months[_loc3_.getMonth()] + " " + _loc3_.getDate();
         var _loc16_ = this.getHoursAmPm(_loc3_.getHours());
         var _loc20_ = _loc3_.getHours() <= _loc3_.getUTCHours() ? _loc3_.getHours() - _loc3_.getUTCHours() - 1 : _loc3_.getHours() - 24 - _loc3_.getUTCHours() - 1;
         this.v6.text = _loc16_.hours + ":" + this.padTime(_loc3_.getMinutes()) + _loc16_.ampm.toLowerCase() + " " + this.getTimezone(_loc3_);
         if(this.history.msg_in == undefined)
         {
            this.history.msg_in = _loc2_.msg_in;
            this.history.msg_out = _loc2_.msg_out;
            this.v9.text = "Sampling";
            this.v10.text = "";
         }
         else
         {
            var _loc17_ = Math.floor((_loc2_.msg_in - this.history.msg_in) / _loc6_);
            var _loc12_ = Math.floor((_loc2_.msg_out - this.history.msg_out) / _loc6_);
            this.history.msg_in = _loc2_.msg_in;
            this.history.msg_out = _loc2_.msg_out;
            this.v9.text = _loc17_;
            this.v10.text = _loc12_;
            this.v10._x = 474 - this.v10.width + 13;
            this.pb1.setProgress(_loc12_,_loc17_ + _loc12_);
         }
         if(this.history.bytes_in == undefined)
         {
            this.history.bytes_in = _loc2_.bytes_in;
            this.history.bytes_out = _loc2_.bytes_out;
            this.v13.text = "Sampling";
            this.v14.text = "";
         }
         else
         {
            var _loc15_ = Math.floor((_loc2_.bytes_in - this.history.bytes_in) / _loc6_);
            var _loc11_ = Math.floor((_loc2_.bytes_out - this.history.bytes_out) / _loc6_);
            this.history.bytes_in = _loc2_.bytes_in;
            this.history.bytes_out = _loc2_.bytes_out;
            this.v13.text = _loc15_;
            this.v14.text = _loc11_;
            this.v14._x = 474 - this.v14.width + 13;
            this.pb2.setProgress(_loc11_,_loc15_ + _loc11_);
         }
         this.prior_time = getTimer();
      }
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
   function onSetApp(newApp)
   {
      this.app = newApp;
      this.sendToProfile("AppsPerformance",this.__server,"onSetApp",this.app);
      this.history = new Object();
      this.onRefresh();
   }
   function setSize(w, h)
   {
      var _loc2_ = (h - 100) / 3;
      var _loc4_ = Math.round(1 * _loc2_);
      this.chart1.setSize(w - 10,_loc4_);
      this.chart2.setSize(w - 10,_loc4_);
      this.chart2._y = 100 + _loc2_;
      this.chart3.setSize(w - 10,_loc4_);
      this.chart3._y = 100 + 2 * _loc2_;
      this.clientChartLabel._y = 80;
      this.bandwidthChartLabel._y = 80 + _loc2_;
      this.cpuMemoryChartLabel._y = 80 + 2 * _loc2_;
      this.clientChartLabel._x = w - this.clientChartLabel.width - 5;
      this.bandwidthChartLabel._x = w - this.bandwidthChartLabel.width - 5;
      this.cpuMemoryChartLabel._x = w - this.cpuMemoryChartLabel.width - 5;
      if(this.clientChartLabel._x < 0)
      {
         this.clientChartLabel._visible = false;
      }
      else
      {
         this.clientChartLabel._visible = true;
      }
      if(this.bandwidthChartLabel._x < 0)
      {
         this.bandwidthChartLabel._visible = false;
      }
      else
      {
         this.bandwidthChartLabel._visible = true;
      }
      if(this.cpuMemoryChartLabel._x < 0)
      {
         this.cpuMemoryChartLabel._visible = false;
      }
      else
      {
         this.cpuMemoryChartLabel._visible = true;
      }
   }
}
