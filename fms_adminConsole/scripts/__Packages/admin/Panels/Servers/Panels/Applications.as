class admin.Panels.Servers.Panels.Applications extends admin.panel
{
   function Applications()
   {
      super();
      this.attachMovie("DataGrid","cGrid",0);
      this.cGrid.rowColors = [15595519,16777215];
      this.cGrid.addColumn("server","Server",85,"Server label on which the app is located",14);
      this.cGrid.addColumn("appName","App Name",120,"Application name",14);
      this.cGrid.addColumn("active","Active",55,"Number of active instances",14);
      this.cGrid.addColumn("loaded","Loaded",60,"Number of instances loaded",14);
      this.cGrid.addColumn("unloaded","Unloaded",70,"Number of instances unloaded",14);
      this.cGrid.addColumn("totalConnects","Connects",66,"Total number of connections to this application",14);
      this.cGrid.addColumn("totalDisconnects","Disconnects",75,"Total number of disconnects from this application",14);
      this.cGrid.addColumn("accepted","Accepted",70,"Accepted connections",14);
      this.cGrid.addColumn("rejected","Rejected",70,"Rejected connections",14);
      this.cGrid.addColumn("MbitsIn","Mbits In",70,"Current bandwidth in to this application, (Mbits)",14);
      this.cGrid.addColumn("MbitsOut","Mbits Out",70,"Current bandwidth out of this application, (Mbits)",14);
      this.cGrid.addColumn("msgIn","Messages In",70,"Messages In to this application",14);
      this.cGrid.addColumn("msgOut","Messages Out",70,"Messages Out of this application",14);
      this.cGrid.addColumn("msgDropped","Messages Dropped",70,"Messages Dropped by this application",14);
      this.__data = new Object();
   }
   function onActivate()
   {
      this.active = true;
      if(this.__node != undefined)
      {
         this.owner.setTitle(this.__node.label," Applications");
      }
   }
   function onDeactivate()
   {
      this.active = false;
   }
   function firstDraw()
   {
      this.nextTab(this.cGrid);
   }
   function onForceRefresh()
   {
   }
   function onLogout()
   {
      this.cGrid.removeAll();
   }
   function onRefresh()
   {
      if(this.active)
      {
         var _loc7_ = 0;
         var _loc5_ = new Array();
         this.appsToBeQueried = new Object();
         if(this.__node == undefined)
         {
            this.__node = this._parent._parent.__currentNode;
            this.owner.setTitle(this.__node.label," Applications");
            this.errorFlag = false;
            this.cGrid.removeAll();
            this.__data = new Object();
         }
         switch(this.__node.type)
         {
            case "cluster":
               var _loc3_ = 0;
               while(_loc3_ < this.__node.length)
               {
                  var _loc4_ = this.__node.getTreeNodeAt(_loc3_);
                  _loc5_.push({sID:_loc4_.nodeid,name:_loc4_.label,index:_loc7_});
                  _loc7_ = _loc7_ + 1;
                  _loc3_ = _loc3_ + 1;
               }
               break;
            case "server":
               _loc5_.push({sID:this.__node.nodeid,name:this.__node.label,index:_loc7_});
               break;
            case "vhost":
               if(_global.conn.getFC(this.__node.parent.nodeid).adminLevel.vhost == this.__node.label)
               {
                  _loc5_.push({sID:this.__node.parent.nodeid,name:this.__node.parent.label,index:_loc7_});
                  break;
               }
               this.owner.setTitle("","You are not logged into:" + this.__node.label + "; please make a separate connection");
               break;
         }
         this.getServerStats(_loc5_);
         this.__serversCalled = _loc5_.length;
      }
   }
   function getServerStats(serverArray)
   {
      for(var _loc3_ in serverArray)
      {
         this.__get__fc().call(serverArray[_loc3_].sID,"getApps",new this.ResBind(this.onGetApps,this,serverArray[_loc3_].name,serverArray[_loc3_].index,serverArray[_loc3_].sID),true,true);
      }
   }
   function onGetApps(result, name, index, sID)
   {
      if(result.level == "status")
      {
         for(var _loc6_ in result.data)
         {
            if(result.data[_loc6_].indexOf("total_apps") == -1)
            {
               this.appsToBeQueried[sID + result.data[_loc6_]] = {name:name};
               this.__get__fc().call(sID,"getAppStats",new this.ResBind(this.onGetAppStats,this,name,index,sID,result.data[_loc6_]),result.data[_loc6_].toString());
            }
         }
      }
      else if(!this.errorFlag)
      {
         this.onError("Unable to get a list of active application instances from server " + name);
         this.errorFlag = true;
      }
      this.__serversCalled = this.__serversCalled - 1;
      if(this.__serversCalled <= 0)
      {
         for(_loc6_ in this.__data)
         {
            if(this.appsToBeQueried[_loc6_] == undefined)
            {
               this.cGrid.removeItemAt(this.__data[_loc6_].id);
               delete this.__data[_loc6_];
            }
         }
      }
   }
   function onGetAppStats(result, name, index, sID, appName)
   {
      if(result.level == "status")
      {
         var _loc2_ = new Object();
         _loc2_.server = name;
         _loc2_.appName = appName;
         _loc2_.active = Number(result.data.total_instances_loaded - result.data.total_instances_unloaded);
         _loc2_.loaded = result.data.total_instances_loaded;
         _loc2_.unloaded = result.data.total_instances_unloaded;
         _loc2_.totalConnects = result.data.total_connects;
         _loc2_.totalDisconnects = result.data.total_disconnects;
         _loc2_.accepted = result.data.accepted;
         _loc2_.rejected = result.data.rejected;
         _loc2_.MbitsIn = this.formatDecimals(Number(result.data.bytes_in) / 8000000,3);
         _loc2_.MbitsOut = this.formatDecimals(Number(result.data.bytes_out) / 8000000,3);
         _loc2_.msgIn = result.data.msg_in;
         _loc2_.msgOut = result.data.msg_out;
         _loc2_.msgDropped = result.data.msg_dropped;
         if(this.__data[sID + appName] != undefined)
         {
            for(var _loc6_ in _loc2_)
            {
               if(this.__data[sID + appName][_loc6_] != _loc2_[_loc6_])
               {
                  this.__data[sID + appName][_loc6_] = _loc2_[_loc6_];
               }
            }
         }
         else
         {
            var _loc7_ = this.cGrid.addItem(_loc2_,true);
            this.__data[sID + appName] = _loc7_;
         }
      }
      else if(!this.errorFlag)
      {
         this.onError("Error in requesting stats from server " + name);
         this.errorFlag = true;
      }
   }
   function onSetServer(node)
   {
      this.__node = node;
      this.errorFlag = false;
      this.cGrid.removeAll();
      this.__data = new Object();
      if(this.__node.type == "vhost")
      {
         this.owner.setTitle(this.__node.parent.label," Applications");
      }
      else
      {
         this.owner.setTitle(this.__node.label," Applications");
      }
      this.onRefresh();
   }
   function setSize(w, h)
   {
      this.cGrid.setSize(w,h);
   }
}
