class admin.Panels.Servers.Panels.Clients extends admin.panel
{
   function Clients()
   {
      super();
      this.attachMovie("DataGrid","cGrid",0);
      this.cGrid.rowColors = [15595519,16777215];
      this.cGrid.addColumn("server","Server",135,"Server label",6);
      this.cGrid.addColumn("connected","Connected",75,"Active connections",6);
      this.cGrid.addColumn("totalConnects","Connects",75,"Total connections since server start",6);
      this.cGrid.addColumn("totalDisconnects","Disconnects",80,"Total disconnects since server start",6);
      this.cGrid.addColumn("Mbits","Mbits In/Out",110,"Current bandwidth in Mbits/s",6);
      this.cGrid.addColumn("msg","Msgs In/Out/Dropped",129,"Messages in, out, and dropped",6);
      this.addControl("Label","msgBox",17,{_x:20,_y:0,width:350,height:15,text:"",autoSize:"left"});
      this.msgBox.setFormat("size",14);
      this.__data = new Object();
   }
   function onActivate()
   {
      this.active = true;
      if(this.__node != undefined)
      {
         this.owner.setTitle(this.__node.label," Connections");
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
   function onLogout()
   {
      this.cGrid.removeAll();
   }
   function onForceRefresh()
   {
   }
   function onRefresh()
   {
      if(this.active)
      {
         var _loc4_ = new Object();
         if(this.__node == undefined)
         {
            this.__node = this._parent._parent.__currentNode;
            this.owner.setTitle(this.__node.label," Connections");
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
                  var _loc2_ = this.__node.getTreeNodeAt(_loc3_);
                  _loc4_[_loc2_.nodeid] = {sID:_loc2_.nodeid,name:_loc2_.label,isVhost:false};
                  _loc3_ = _loc3_ + 1;
               }
               break;
            case "server":
               _loc4_[this.__node.nodeid] = {sID:this.__node.nodeid,name:this.__node.label,isVhost:false};
               break;
            case "vhost":
               _loc4_[this.__node.parent.nodeid] = {sID:this.__node.parent.nodeid,name:this.__node.label,isVhost:true};
         }
         this.getServerStats(_loc4_);
      }
   }
   function getServerStats(serversToBeQueried)
   {
      for(var _loc3_ in serversToBeQueried)
      {
         if(serversToBeQueried[_loc3_].isVhost)
         {
            this.__get__fc().call(serversToBeQueried[_loc3_].sID,"getVHostStats",new this.ResBind(this.onGetVhostStats,this,serversToBeQueried[_loc3_].name),"_defaultRoot_",serversToBeQueried[_loc3_].name,serversToBeQueried[_loc3_].sID);
         }
         else
         {
            this.__get__fc().call(serversToBeQueried[_loc3_].sID,"getServerStats",new this.ResBind(this.onGetServerStats,this,serversToBeQueried[_loc3_].name,serversToBeQueried[_loc3_].sID));
         }
      }
      for(_loc3_ in this.__data)
      {
         if(serversToBeQueried[_loc3_] == undefined && _loc3_ != undefined)
         {
            this.cGrid.removeItemAt(this.__data[_loc3_].id);
            delete this.__data[_loc3_];
         }
      }
   }
   function displayMessage(hide, msg)
   {
      this.msgBox._visible = hide;
      this.msgBox.text = msg;
      this.cGrid.removeAll();
      this.owner.setTitle("","");
      this.owner.tabs._visible = !hide;
   }
   function onGetServerStats(result, name, sID)
   {
      if(result.level == "status")
      {
         var _loc2_ = new Object();
         _loc2_.server = name;
         _loc2_.connected = result.data.io.connected;
         _loc2_.totalConnects = result.data.io.total_connects;
         _loc2_.totalDisconnects = result.data.io.total_disconnects;
         _loc2_.Mbits = this.formatDecimals(Number(result.data.io.bytes_in) / 8000000,3) + " / " + this.formatDecimals(Number(result.data.io.bytes_out) / 8000000,3);
         _loc2_.msg = result.data.io.msg_in + " / " + result.data.io.msg_out + " / " + result.data.io.msg_dropped;
         _loc2_.sID = sID;
         if(this.__data[sID] != undefined)
         {
            for(var _loc5_ in _loc2_)
            {
               if(this.__data[sID][_loc5_] != _loc2_[_loc5_])
               {
                  this.__data[sID][_loc5_] = _loc2_[_loc5_];
               }
            }
         }
         else
         {
            var _loc6_ = this.cGrid.addItem(_loc2_,true);
            this.__data[sID] = _loc6_;
         }
      }
      else if(!this.errorFlag)
      {
         this.onError("Error requesting stats from the server " + name);
         this.errorFlag = true;
      }
   }
   function onGetVhostStats(result, name, sID)
   {
      if(result.level == "status")
      {
         var _loc2_ = new Object();
         _loc2_.server = name;
         _loc2_.connected = result.data.connected;
         _loc2_.totalConnects = result.data.total_connects;
         _loc2_.totalDisconnects = result.data.total_disconnects;
         _loc2_.Mbits = this.formatDecimals(Number(result.data.bytes_in) / 8000000,3) + " / " + this.formatDecimals(Number(result.data.bytes_out) / 8000000,3);
         _loc2_.msg = result.data.msg_in + " / " + result.data.msg_out + " / " + result.data.msg_dropped;
         _loc2_.sID = sID;
         if(this.__data[sID] != undefined)
         {
            for(var _loc5_ in _loc2_)
            {
               this.__data[sID][_loc5_] = _loc2_[_loc5_];
            }
         }
         else
         {
            var _loc6_ = this.cGrid.addItem(_loc2_,true);
            this.__data[sID] = _loc6_;
         }
      }
      else if(!this.errorFlag)
      {
         this.onError("Error requesting stats from the vHost  " + name);
         this.errorFlag = true;
      }
   }
   function dataIsDifferent(o1, o2)
   {
      for(var _loc3_ in o1)
      {
         if(o1[_loc3_] != o2[_loc3_])
         {
            return true;
         }
      }
      return false;
   }
   function onSetServer(node)
   {
      this.__node = node;
      this.errorFlag = false;
      this.cGrid.removeAll();
      this.__data = new Object();
      this.owner.setTitle(this.__node.label," Connections");
      this.onRefresh();
   }
   function setSize(w, h)
   {
      this.cGrid.setSize(w,h);
   }
}
