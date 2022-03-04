class admin.Panels.Servers.Container extends admin.panel
{
   var __mode = 0;
   function Container()
   {
      super();
      this.xOffset = this.__get__Cache().getProp("servers/xOffset",233);
      this.createEmptyMovieClip("backing",0);
      this.attachMovie("TabSet","tabs",1);
      this.attachMovie("Common_Header","cHeader",2);
      this.attachMovie("ClustersTree","clustersTree",4);
      this.createEmptyMovieClip("hiButtonHolder",6);
      this.createEmptyMovieClip("loButtonHolder",5);
      this.createEmptyMovieClip("buttonMask",7);
      this.hiButtonHolder.attachMovie("Button","newServerButton",7);
      this.hiButtonHolder.attachMovie("Button","editButton",9);
      this.hiButtonHolder.attachMovie("Button","deleteButton",10);
      this.loButtonHolder.attachMovie("Button","connectButton",7);
      this.loButtonHolder.attachMovie("Button","pingButton",8);
      this.loButtonHolder.attachMovie("Button","reloadButton",9);
      this.loButtonHolder.attachMovie("Button","garbageButton",10);
      this.loButtonHolder.attachMovie("Button","stopButton",11);
      this.hiButtonHolder.attachMovie("Label","treeLabel",11);
      this.createEmptyMovieClip("form_holder",14);
      this.attachMovie("Seperator","seperator",15);
      this.addControl("Label","serverNameLabel",12,{_x:this.xOffset + 7,_y:36,width:100,height:20,text:""});
      this.serverNameLabel.setFormat("size",14);
      this.serverNameLabel.autoSize = "left";
      this.serverNameLabel.text = "";
      this.addControl("Label","panelLabel",13,{_x:this.xOffset + 7,_y:36,width:100,height:20,text:""});
      this.panelLabel.setFormat("size",14);
      this.panelLabel.setFormat("color",5592405);
      this.panelLabel.autoSize = "left";
      this.panelLabel.text = "";
      this.tabs._y = 7;
      this.tabs.addListener("click",this.onChange,this);
      this.clustersTree._y = 29;
      this.clustersTree.addListener("change",this.onTreeSelect,this);
      this.clustersTree.addListener("redraw",this.onTreeRedraw,this);
      this.hiButtonHolder.newServerButton.setSize(28,24);
      this.hiButtonHolder.newServerButton.icon = "icon_addNewServer";
      this.hiButtonHolder.newServerButton._x = 139;
      this.hiButtonHolder.newServerButton.label = "";
      this.hiButtonHolder.newServerButton.addListener("click",this.newServer,this);
      this.addToolTip("Add a new server",this.hiButtonHolder.newServerButton);
      this.hiButtonHolder.editButton.label = "";
      this.hiButtonHolder.editButton.icon = "icon_servers_edit";
      this.hiButtonHolder.editButton.setSize(24,24);
      this.hiButtonHolder.editButton._x = 169;
      this.hiButtonHolder.editButton.addListener("click",this.changeMode,this);
      this.addToolTip("Edit server login information",this.hiButtonHolder.editButton);
      this.hiButtonHolder.deleteButton.label = "";
      this.hiButtonHolder.deleteButton.icon = "icon_servers_delete";
      this.hiButtonHolder.deleteButton.setSize(24,24);
      this.hiButtonHolder.deleteButton._x = 195;
      this.hiButtonHolder.deleteButton.addListener("click",this.onDelete,this);
      this.addToolTip("Remove server from list",this.hiButtonHolder.deleteButton);
      this.loButtonHolder.connectButton.label = "";
      this.loButtonHolder.connectButton.icon = "icon_connect";
      this.loButtonHolder.connectButton.setSize(24,24);
      this.loButtonHolder.connectButton._x = 95;
      this.loButtonHolder.connectButton.addListener("click",this.onConnect,this);
      this.addToolTip("Connect to server",this.loButtonHolder.connectButton);
      this.loButtonHolder.pingButton.label = "";
      this.loButtonHolder.pingButton.icon = "icon_servers_ping";
      this.loButtonHolder.pingButton.setSize(24,24);
      this.loButtonHolder.pingButton._x = 120;
      this.loButtonHolder.pingButton.addListener("click",this.onPing,this);
      this.addToolTip("Ping server",this.loButtonHolder.pingButton);
      this.loButtonHolder.reloadButton.label = "";
      this.loButtonHolder.reloadButton.icon = "icon_servers_reloadRestart";
      this.loButtonHolder.reloadButton.setSize(24,24);
      this.loButtonHolder.reloadButton._x = 145;
      this.loButtonHolder.reloadButton.addListener("click",this.onReload,this);
      this.addToolTip("Restart server or vhost",this.loButtonHolder.reloadButton);
      this.loButtonHolder.garbageButton.label = "";
      this.loButtonHolder.garbageButton.icon = "icon_servers_garbage";
      this.loButtonHolder.garbageButton.setSize(24,24);
      this.loButtonHolder.garbageButton._x = 170;
      this.loButtonHolder.garbageButton.addListener("click",this.onGC,this);
      this.addToolTip("Run garbage collection on server",this.loButtonHolder.garbageButton);
      this.loButtonHolder.stopButton.label = "";
      this.loButtonHolder.stopButton.icon = "icon_servers_stop";
      this.loButtonHolder.stopButton.setSize(24,24);
      this.loButtonHolder.stopButton._x = 195;
      this.loButtonHolder.stopButton.addListener("click",this.onStop,this);
      this.addToolTip("Stop server or vhost",this.loButtonHolder.stopButton);
      this.hiButtonHolder.treeLabel.text = "Servers(none)";
      this.hiButtonHolder.treeLabel.setFormat("color",3361385);
      this.hiButtonHolder.treeLabel.setFormat("bold",true);
      this.hiButtonHolder.treeLabel.autoSize = "left";
      this.hiButtonHolder.treeLabel._x = 10;
      this.hiButtonHolder.treeLabel._y = 5;
      var _loc7_ = this.__get__Cache().getProp("servers/lastTabLabel","details");
      var _loc6_ = [["Details",88,24,"details","Server details: connections, bw, cpu and memory"],["Connections",110,24,"clients","Connection details"],["Applications",124,24,"applications","Application details"],["License",65,24,"license","License information"],["Server Log",90,24,"log","Server logs"]];
      var _loc4_ = 0;
      while(_loc4_ < _loc6_.length)
      {
         var _loc3_ = _loc6_[_loc4_];
         var _loc5_ = _loc3_[3] == _loc7_;
         this.tabs.addButton(_loc3_[0],_loc3_[1],_loc3_[2],_loc5_,_loc3_[3],_loc3_[4]);
         _loc4_ = _loc4_ + 1;
      }
      this.hiButtonHolder.setMask(this.buttonMask);
      this.loButtonHolder.setMask(this.buttonMask);
      var o = this;
      this.seperator.onPress = function()
      {
         o.doDrag();
      };
      this.seperator.onRelease = this.seperator.onReleaseOutside = function()
      {
         o.endDrag();
      };
      this.seperator._focusrect = false;
      this.seperator.tabEnabled = false;
      this.dragListner = new Object();
      this.dragListner.onMouseMove = function()
      {
         o.onDrag();
      };
   }
   function doDrag()
   {
      this.seperator.startX = this.seperator._xmouse;
      this.firstDrag = true;
      Mouse.addListener(this.dragListner);
   }
   function onDrag()
   {
      if(this.firstDrag == true)
      {
         this.seperator.hasDragged = true;
         this.setVisible(false);
         this.firstDrag = false;
      }
      var _loc2_ = this._xmouse - this.seperator.startX;
      this.xOffset = _loc2_ + 6;
      if(this.xOffset < 233)
      {
         this.xOffset = 233;
      }
      if(this.xOffset > this.__width)
      {
         this.xOffset = this.__width;
      }
      this.__get__Cache().setProp("servers/uncv",this.xOffset);
      this.seperator._x = this.xOffset - 7;
      this.backing.clear();
      this.drawRect(this.backing,this.xOffset,0,this.__width - this.xOffset,this.__height,16777215,30,4);
      this.drawRect(this.backing,0,0,this.xOffset - 9,this.__height,16777215,20,4);
   }
   function endDrag()
   {
      Mouse.removeListener(this.dragListner);
      if(this.firstDrag == true)
      {
         if(this.xOffset == 5)
         {
            this.xOffset = this.__get__Cache().getProp("servers/uncv",233);
         }
         else
         {
            this.xOffset = 5;
         }
      }
      this.setVisible(true);
      this.setSize(this.__width,this.__height);
      this.__get__Cache().setProp("servers/xOffset",this.xOffset);
   }
   function setVisible(b)
   {
      this.PanelSpace._visible = b;
      this.tabs._visible = b;
      this.cHeader._visible = b;
      this.clustersTree._visible = b;
      this.loButtonHolder._visible = b;
      this.hiButtonHolder._visible = b;
      this.form_holder._visible = b;
      this.serverNameLabel._visible = b;
      this.panelLabel._visible = b;
   }
   function changeMode()
   {
      if(this.__mode == 1)
      {
         this.__mode = 0;
         this.showForm(null);
      }
      else
      {
         this.__mode = 1;
         this.updateForm();
      }
   }
   function onGC()
   {
      this.__get__fc().call(this.clustersTree.selectedNode.nodeid,"gc",new this.ResBind(this.onGCResponse,this,this.clustersTree.selectedNode.label));
   }
   function onGCResponse(result)
   {
      if(result.level == "status")
      {
         this.onInfo("Garbage collection successful.");
      }
      else
      {
         this.onError("Garbage collection could not be run.");
      }
   }
   function onDelete()
   {
      switch(this.clustersTree.selectedNode.type)
      {
         case "server":
            this.onAlert("Form_DeleteServer",295,120,"Removing server:  " + this.clustersTree.selectedNode.label,this);
            break;
         case "vhost":
      }
   }
   function selectFirstConnected()
   {
      var _loc2_ = this.clustersTree.cTree.selectFirstItem("type","server",this.conValidate);
      if(!_loc2_)
      {
         this.clustersTree.cTree.selectFirstItem("type","server");
      }
   }
   function conValidate(row)
   {
      if(row.icon == "icon_list_Server_connected")
      {
         return true;
      }
      return false;
   }
   function deleteServer()
   {
      this.selectFlag = null;
      this.__get__Clusters().removeServer(this.clustersTree.selectedNode.nodeid);
      this.selectFirstConnected();
   }
   function onPing()
   {
      if(this.clustersTree.selectedNode.type != "server")
      {
         this.onError(this.clustersTree.selectedNode.label + " is not a server. Please select a server to ping.");
      }
      else if(!this.clustersTree.selectedNode.connected)
      {
         this.onError(this.clustersTree.selectedNode.label + " is not connected. Connect to this server first and then try pinging again.");
      }
      else
      {
         this.__get__fc().call(this.clustersTree.selectedNode.nodeid,"ping",new this.ResBind(this.onPingResponse,this,this.clustersTree.selectedNode.label,getTimer()));
      }
   }
   function onPingResponse(result, label, startTime)
   {
      if(result.level == "status")
      {
         this.onInfo("Server " + label + " successfully pinged. Ping time approximately " + Math.round((getTimer() - startTime) / 2) + "ms.");
      }
      else
      {
         this.onError("Failure atempting to ping server " + label);
      }
   }
   function newServer()
   {
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      switch(this.clustersTree.selectedNode.type)
      {
         case "server":
            _loc4_ = this.clustersTree.selectedNode.parent.nodeid;
            _loc3_ = this.clustersTree.selectedNode.nodeid;
            break;
         case "vhost":
            _loc4_ = this.clustersTree.selectedNode.parent.parent.nodeid;
            _loc3_ = this.clustersTree.selectedNode.parent.nodeid;
      }
      var _loc5_ = "s" + _global.cm.store.sc;
      this.selectFlag = _loc5_;
      _loc5_ = this.__get__Clusters().addServer(_loc4_,_loc3_,{label:"New Server"});
   }
   function onReload()
   {
      if(this.clustersTree.selectedNode.type == "server")
      {
         this.onAlert("Form_RestartServer",295,120,"Restarting server:  " + this.clustersTree.selectedNode.label,this);
      }
      else
      {
         this.onAlert("Form_RestartVHost",295,120,"Restarting vhost:" + this.clustersTree.selectedNode.label,this);
      }
   }
   function restartServer()
   {
      this.onInfo("Sending restart request to  " + this.clustersTree.selectedNode.label + ". Waiting for a response...");
      this.__get__fc().call(this.clustersTree.selectedNode.nodeid,"startServer",new this.ResBind(this.onRestartResponse,this,this.clustersTree.selectedNode.label),"restart");
      _global.conn.getFC(this.clustersTree.selectedNode.nodeid).canCall = false;
   }
   function restartVHost()
   {
      this.onInfo("Sending restart request to  " + this.clustersTree.selectedNode.label + ". Waiting for a response...");
      this.__get__fc().call(this.clustersTree.selectedNode.nodeid,"restartVHost",new this.ResBind(this.onRestartVHResponse,this,this.clustersTree.selectedNode.label),this.clustersTree.selectedNode.label);
      _global.conn.getFC(this.clustersTree.selectedNode.nodeid).canCall = false;
   }
   function onRestartResponse(result, label)
   {
      if(result.level == "status")
      {
         this.onInfo("Server " + label + " successfully restarted at " + result.timestamp);
      }
      else
      {
         this.onError("Failed to restart server " + label);
      }
      _global.conn.getFC(this.clustersTree.selectedNode.nodeid).canCall = true;
      _global.cm.dispatchEvent("change",{target:_global.cm});
   }
   function onRestartVHResponse(result, label)
   {
      if(result.level == "status")
      {
         this.onInfo("Virtual Host " + label + " successfully restarted at " + result.timestamp);
      }
      else
      {
         this.onError("Failed to restart virtual host " + label);
      }
      _global.conn.getFC(this.clustersTree.selectedNode.nodeid).canCall = true;
      _global.cm.dispatchEvent("change",{target:_global.cm});
   }
   function onStop()
   {
      if(this.clustersTree.selectedNode.type == "server")
      {
         this.onAlert("Form_StopServer",295,120,"Stopping server:  " + this.clustersTree.selectedNode.label,this);
      }
      else
      {
         this.onAlert("Form_StopVHost",295,120,"Stopping vhost:  " + this.clustersTree.selectedNode.label,this);
      }
   }
   function stopServer()
   {
      this.onInfo("Sending stop request to " + this.clustersTree.selectedNode.label + ". Waiting for a response...");
      this.__get__fc().call(this.clustersTree.selectedNode.nodeid,"stopServer",new this.ResBind(this.onStopResponse,this,this.clustersTree.selectedNode.label),"normal");
      _global.conn.getFC(this.clustersTree.selectedNode.nodeid).canCall = false;
   }
   function stopVHost()
   {
      this.onInfo("Sending stop request to " + this.clustersTree.selectedNode.label + ". Waiting for a response...");
      this.__get__fc().call(this.clustersTree.selectedNode.nodeid,"stopVHost",new this.ResBind(this.onStopVHResponse,this,this.clustersTree.selectedNode.label),this.clustersTree.selectedNode.label);
      _global.conn.getFC(this.clustersTree.selectedNode.nodeid).canCall = false;
   }
   function onStopResponse(result, label)
   {
      if(result.level == "status")
      {
         this.onInfo("Server " + label + " successfully stopped at " + result.timestamp);
      }
      else
      {
         this.onError("Failed to stop server " + label);
      }
      _global.conn.getFC(this.clustersTree.selectedNode.nodeid).canCall = true;
      _global.cm.dispatchEvent("change",{target:_global.cm});
      this.updateUI();
   }
   function onStopVHResponse(result, label)
   {
      if(result.level == "status")
      {
         this.onInfo("Virtual Host " + label + " successfully stopped at " + result.timestamp);
      }
      else
      {
         this.onError("Failed to stop virtual host " + label);
      }
      _global.conn.getFC(this.clustersTree.selectedNode.nodeid).canCall = true;
      _global.cm.dispatchEvent("change",{target:_global.cm});
      this.updateUI();
   }
   function onConnect()
   {
      this.selectFlag = this.clustersTree.selectedNode.nodeid;
      _global.cm.connect(this.clustersTree.selectedNode.nodeid);
   }
   function drawPanels()
   {
      this.PanelSpace._y = 60;
      this.PanelSpace.registerPanel("details","panel_Servers_Details");
      this.PanelSpace.registerPanel("clients","panel_Servers_Clients");
      this.PanelSpace.registerPanel("applications","panel_Servers_Applications");
      this.PanelSpace.registerPanel("license","panel_Servers_License");
      this.PanelSpace.registerPanel("log","panel_Servers_Log");
      this.nextTab(this.clustersTree.cTree);
      this.nextTab(this.hiButtonHolder.newServerButton);
      this.nextTab(this.hiButtonHolder.editButton);
      this.nextTab(this.hiButtonHolder.deleteButton);
      this.nextTab(this.loButtonHolder.connectButton);
      this.nextTab(this.loButtonHolder.pingButton);
      this.nextTab(this.loButtonHolder.reloadButton);
      this.nextTab(this.loButtonHolder.garbageButton);
      this.nextTab(this.loButtonHolder.stopButton);
      this.nextTab(this.tabs.getItemAt(0));
      this.nextTab(this.tabs.getItemAt(1));
      this.nextTab(this.tabs.getItemAt(2));
      this.nextTab(this.tabs.getItemAt(3));
      this.nextTab(this.tabs.getItemAt(4));
      this.form_holder.attachMovie("Form_newServer","f2",1);
      this.form_holder.f1._visible = this.form_holder.f2._visible = false;
   }
   function showForm(f, sel, news)
   {
      this.lastForm = f;
      this.lastSel = sel;
      this.form_holder.f1._visible = false;
      this.form_holder.f2._visible = false;
      this.form_holder[f].setSelected(sel,news);
      this.form_holder[f].owner = this;
      this.form_holder[f]._visible = true;
      this.activeForm = this.form_holder[f];
      if(f == null)
      {
         if(!this.__vHostAdmin)
         {
            this.tabs._visible = this.PanelSpace._visible = true;
         }
         this.serverNameLabel._visible = this.panelLabel._visible = true;
         this.__mode = 0;
         _global.tabs.setOrder("main,Servers," + this.PanelSpace.focusedScreen.__tID);
      }
      else
      {
         this.tabs._visible = this.PanelSpace._visible = this.serverNameLabel._visible = this.panelLabel._visible = false;
         _global.tabs.setOrder("main,Servers," + f);
      }
   }
   function onActivate()
   {
      this.showForm(this.lastForm,this.lastSel);
      var _loc3_ = _global.tabOffset;
      this.clustersTree.tabIndex = _loc3_ + 1;
      this.newServerButton.tabIndex = _loc3_ + 1;
      this.tabs.tabStart = _loc3_ + 1;
      var _loc4_ = this.__get__Cache().getProp("servers/lastTabLabel","details");
      this.PanelSpace.show(_loc4_);
      if(_global.newCluster == true)
      {
         _global.newCluster = false;
         var _loc5_ = _global.newClusterRef;
         this.showForm("f1",_loc5_,true);
         this.__mode = 1;
         this.form_holder.f1.t1.setFocus();
      }
      this.updateUI();
   }
   function onDeactivate()
   {
   }
   function onRefresh()
   {
   }
   function onLogout()
   {
   }
   function onGetServer(data, node)
   {
   }
   function onTreeSelect(evt)
   {
      this.updateUI();
      this.PanelSpace.send("onSetServer",this.__currentNode);
   }
   function updateUI()
   {
      this.__currentNode = this.clustersTree.cTree.selectedItem;
      if(this.clustersTree.selectedNode == undefined)
      {
         this.__vHostAdmin = false;
         this.panelLabel.text = "No servers are currently connected. Please connect to a server first";
         this.panelLabel._x = this.xOffset + 20;
         this.serverNameLabel.text = "";
         this.PanelSpace._visible = false;
         this.tabs._visible = false;
         return undefined;
      }
      if(_global.conn.getFC(this.__currentNode.nodeid).adminLevel.admin_type == "server")
      {
         if(this.__mode == 1)
         {
            this.__vHostAdmin = false;
            this.PanelSpace._visible = true;
            this.tabs._visible = true;
            this.PanelSpace.send("setOwner",this);
            this.updateForm();
         }
         else if(this.clustersTree.selectedNode.connected)
         {
            this.__vHostAdmin = false;
            this.setTitle("","");
            this.PanelSpace._visible = true;
            this.tabs._visible = true;
            this.PanelSpace.send("setOwner",this);
         }
         else
         {
            this.__vHostAdmin = false;
            this.setTitle("","");
            this.panelLabel.text = "The selected server is not connected. Please try connecting it first.";
            this.panelLabel._x = this.xOffset + 20;
            this.serverNameLabel.text = "";
            this.PanelSpace._visible = false;
            this.tabs._visible = false;
         }
      }
      else
      {
         this.__vHostAdmin = true;
         if(this.__currentNode.connected)
         {
            this.panelLabel.text = "As a vHost admin you do not have access to the Manage Servers panel";
         }
         else
         {
            this.panelLabel.text = "The selected server is not connected. Please try connecting it first.";
         }
         this.panelLabel._x = this.xOffset + 20;
         this.serverNameLabel.text = "";
         this.PanelSpace._visible = false;
         this.tabs._visible = false;
         this.updateForm();
      }
   }
   function updateForm()
   {
      var _loc3_ = this.clustersTree.selectedNode;
      if(this.__mode == 1)
      {
         var _loc2_ = "f1";
         _loc2_ = "f2";
         this.showForm(_loc2_,_loc3_.nodeid);
      }
      else
      {
         this.showForm(null);
      }
   }
   function onChange(evt)
   {
      this.setTitle("","");
      this.PanelSpace.show(evt.data);
      this.__get__Cache().setProp("servers/lastTabLabel",evt.data);
      this.updateUI();
      this.PanelSpace.send("onSetServer",this.__currentNode);
   }
   function onTreeRedraw(evt)
   {
      this.hiButtonHolder.treeLabel.text = "Servers (" + evt.target.serverCount + ")";
      if(this.selectFlag != undefined)
      {
         this.clustersTree.cTree.selectFirstItem("nodeid",this.selectFlag,this.selVF);
      }
      this.updateUI();
   }
   function selVF(item, val)
   {
      if(item.nodeid != val)
      {
         return false;
      }
      return true;
   }
   function setTitle(serverName, panelName)
   {
      if(!this.__vHostAdmin && this.clustersTree.selectedNode.connected)
      {
         this.serverNameLabel.text = serverName;
         this.panelLabel.text = panelName;
         this.panelLabel._x = this.serverNameLabel._x + this.serverNameLabel.width;
      }
   }
   function setSize(w, h)
   {
      this.__width = w;
      this.__height = h;
      this.backing.clear();
      this.buttonMask.clear();
      this.drawRect(this.backing,this.xOffset,0,w - this.xOffset,h,16777215,30,4);
      if(this.xOffset != 0)
      {
         this.drawRect(this.backing,0,h - 40,this.xOffset - 9,40,16777215,20,4);
         this.drawRect(this.buttonMask,0,9,this.xOffset - 9,h,16777215,100,4);
      }
      this.seperator._y = h / 2 - this.seperator._height / 2;
      this.seperator._x = this.xOffset - 7;
      this.tabs._x = this.xOffset + 7;
      this.PanelSpace._x = this.xOffset;
      this.PanelSpace.setSize(w - this.xOffset,h - 60);
      this.form_holder._x = this.xOffset;
      this.form_holder.f1.setSize(w - this.xOffset,h);
      this.form_holder.f2.setSize(w - this.xOffset,h);
      this.hiButtonHolder._y = 3;
      this.loButtonHolder._y = h - 28;
      this.hiButtonHolder.treeLabel._y = 5;
      if(this.xOffset > 5)
      {
         this.serverNameLabel._x = this.xOffset + 7;
         this.clustersTree._visible = true;
         this.cHeader._visible = true;
         this.hiButtonHolder._visible = true;
         this.loButtonHolder._visible = true;
         this.panelLabel._x = this.serverNameLabel._x + this.serverNameLabel.width + 20;
         this.clustersTree.setSize(this.xOffset - 9,h - 59);
         this.cHeader.setSize(this.xOffset - 9,24);
         this.seperator.gotoAndStop(1);
      }
      else
      {
         this.seperator._x = 0;
         this.hiButtonHolder._visible = false;
         this.loButtonHolder._visible = false;
         this.clustersTree._visible = false;
         this.cHeader._visible = false;
         this.seperator.gotoAndStop(2);
      }
      this.updateUI();
      this.updateForm();
   }
}
