class admin.Panels.Application.Container extends admin.panel
{
   function Container()
   {
      super();
      _global.appsContainer = this;
      this.xOffset = this.__get__Cache().getProp("xOffset",211);
      this.appTemp = new Object();
      this.DC_1 = new admin.general.DataCompare();
      this.appsArray = new Array();
      this.infoArray = new Object();
      this.DC_1.owner = this;
      this.newInstTemp = new Object();
      this.isConnectedVHost = true;
      this.createEmptyMovieClip("backing",0);
      this.addControl("Label","ss1",6,{width:300,height:35,text:"",autoSize:"left",_x:this.xOffset + 20,_y:40});
      this.ss1.setFormat("bold",true);
      this.ss1.setFormat("size",14);
      this.ss1.autoSize = "left";
      this.addControl("Label","ss2",7,{width:300,height:35,text:"",autoSize:"left",_x:this.ss1._x + this.ss1.width,_y:40});
      this.ss2.setFormat("size",14);
      this.ss2.setFormat("color",6710886);
      this.ss2.autoSize = "left";
      this.addControl("ComboBox","na_combo",5,{width:125,height:24,_x:4,staticLabel:"New Instance..."});
      this.na_combo.addListener("change",this.onNewApp,this);
      this.na_combo.listHeight = 200;
      this.na_combo.listWidth = 194;
      this.addToolTip("Load an application instance",this.na_combo);
      this.attachMovie("ComboClustersTree","clusterTree",11);
      this.clusterTree.setSize(60,24);
      this.clusterTree.labelPrefix = "Server: ";
      this.clusterTree.addListener("change",this.onSetServer,this);
      this.addControl("DataGrid","appList",4,{_y:29,multipleSelection:true});
      this.appList.addColumn("name","Name",125,"Application name",2);
      this.appList.addColumn("cc","Clients",66,"Active clients",2);
      this.appList.setRender("name","Apps_DG_render");
      this.appList.addListener("change",this.onChange,this);
      this.appList.addListener("enter",this.onEnter,this);
      this.appList.addListener("delete",this.doUnload,this);
      this.appList.setterEvent = true;
      this.appList.vLines = false;
      this.appList.hLines = true;
      this.appList.setScrollSelection(false);
      this.addControl("Button","reloadBtn",8,{width:24,height:24});
      this.reloadBtn._y = 7;
      this.reloadBtn.icon = "icon_servers_reloadRestart";
      this.reloadBtn.addListener("click",this.doReload,this);
      this.addToolTip("Reload this application",this.reloadBtn);
      this.addControl("Button","killBtn",9,{width:24,height:24});
      this.killBtn._y = 7;
      this.killBtn.icon = "icon_servers_stop";
      this.killBtn.addListener("click",this.doUnload,this);
      this.addToolTip("Unload this application",this.killBtn);
      this.addControl("TabSet","tabs",1,{_y:7});
      var _loc8_ = this.__get__Cache().getProp("application/lastTabLabel","log");
      var _loc7_ = [["Live Log",88,24,"log","Application log"],["Clients",64,24,"clients","Active clients (includes debug connections)"],["Shared Objects",124,24,"sharedobjects","Shared Objects"],["Streams",65,24,"streams","Streams"],["Performance",90,24,"performance","Performance Statistics: IO, Bandwidth, Uptime, etc"]];
      var _loc5_ = 0;
      while(_loc5_ < _loc7_.length)
      {
         var _loc4_ = _loc7_[_loc5_];
         var _loc6_ = _loc4_[3] == _loc8_;
         this.tabs.addButton(_loc4_[0],_loc4_[1],_loc4_[2],_loc6_,_loc4_[3],_loc4_[4]);
         _loc5_ = _loc5_ + 1;
      }
      this.tabs.addListener("click",this.onChange,this);
      this.tabs.addListener("click",this.onSetTab,this);
      this.addControl("Label","ss3",10,{width:300,height:35,text:"Press enter to submit the new instance name for application. Press ESC+SHIFT to cancel",autoSize:"left",_x:this.ss1._x,_y:60,_visible:false});
      this.addControl("Label","ss4",15,{width:300,height:35,text:"Please select an application",autoSize:"left",_x:this.ss1._x,_y:36,_visible:false});
      this.ss4.setFormat("size",14);
      this.ss4.setFormat("color",5592405);
      this.attachMovie("Seperator","seperator",12);
      this.attachMovie("Button","kdb",16);
      this.kdb.setSize(100,22);
      this.kdb.label = "Close Debug";
      this.kdb._y = 7;
      this.kdb._visible = false;
      this.kdb.addListener("click",this.onKillDebug,this);
      this.addToolTip("Close Debug Connection",this.kdb);
      var _loc9_ = this.kdb.UISpace.attachMovie("ConnectionLight","kl",9);
      _loc9_.gotoAndStop(3);
      _loc9_._height = 20;
      _loc9_._width = 7;
      _loc9_._x = 1;
      _loc9_._y = 1;
      this.manageClip(this.PanelSpace,{minHeight:20});
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
      this.kListner = new Object();
      this.kListner.onKeyDown = function()
      {
         if(Key.isDown(27))
         {
            o.killNewInst();
         }
      };
      Key.addListener(this);
   }
   function onKeyDown()
   {
      if(this.na_combo.isFocused == true && this.na_combo.isActive() == true && !Key.isDown(40) && !Key.isDown(38) && !Key.isDown(13) && !Key.isDown(34) && !Key.isDown(33))
      {
         "passed requirements";
         this.onNIKey();
      }
   }
   function onNIKey()
   {
      if(eval(Selection.getFocus()) != this.na_combo.label_txt)
      {
         this.na_combo.label_txt.type = "input";
         this.na_combo.label_txt.selectable = true;
         var o = this;
         this.na_combo.label_txt.onChanged = function()
         {
            o.doChange();
         };
         Selection.setFocus(this.na_combo.label_txt);
      }
   }
   function doChange()
   {
      if(this.onEnterClip == null)
      {
         var _loc3_ = this.na_combo.label_txt.length;
         var _loc4_ = this.na_combo.label_txt.text;
         if(_loc4_ != "" && _loc4_ != "New Instance..." && !(Key.isDown(8) || Key.isDown(46)))
         {
            var _loc2_ = 0;
            while(_loc2_ < this.appsArray.length)
            {
               if(this.appsArray[_loc2_].slice(0,_loc3_) == _loc4_)
               {
                  this.na_combo.label_txt.text = this.appsArray[_loc2_];
                  Selection.setSelection(_loc3_,this.appsArray[_loc2_].length);
                  this.na_combo.lb.selectedIndex = _loc2_;
                  break;
               }
               _loc2_ = _loc2_ + 1;
            }
         }
      }
   }
   function doDrag()
   {
      this.seperator.startX = this.seperator._xmouse;
      this.firstDrag = true;
      Mouse.addListener(this.dragListner);
   }
   function show(b)
   {
      this.PanelSpace._visible = b;
      this.tabs._visible = b;
      this.reloadBtn._visible = b;
      this.killBtn._visible = b;
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
      if(this.xOffset < 211)
      {
         this.xOffset = 211;
      }
      if(this.xOffset > this.__width)
      {
         this.xOffset = this.__width;
      }
      this.__get__Cache().setProp("apps/uncv",this.xOffset);
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
            this.xOffset = this.__get__Cache().getProp("apps/uncv",211);
         }
         else
         {
            this.xOffset = 5;
         }
      }
      this.setVisible(true);
      this.showBase(true);
      this.setSize(this.__width,this.__height);
      this.moveText();
      this.updateUI();
      this.__get__Cache().setProp("xOffset",this.xOffset);
   }
   function setVisible(b)
   {
      this.PanelSpace._visible = b;
      this.tabs._visible = b;
      this.appList._visible = b;
      this.na_combo._visible = b;
      this.ss1._visible = b;
      this.ss2._visible = b;
      this.reloadBtn._visible = b;
      this.killBtn._visible = b;
      this.clusterTree._visible = b;
      this.ss3._visible = b;
      this.ss4._visible = b;
   }
   function debugStatus()
   {
      this.checkDebug();
   }
   function checkDebug()
   {
      if(_global.conn.inDebug(this.__server,this.selectedApplication) == true)
      {
         if(this.ss3._visible == false)
         {
            this.kdb._visible = this.__width > 760;
         }
         else
         {
            this.kdb._visible = false;
         }
         this.kdb.isVisible = true;
      }
      else
      {
         this.kdb._visible = false;
         this.kdb.isVisible = false;
      }
   }
   function onKillDebug()
   {
      _global.conn.killDebug(this.__server,this.selectedApplication);
      this.checkDebug();
   }
   function doReload()
   {
      var _loc3_ = this.appList.selectedItems;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         this.__get__fc().call(this.__server,"reloadApp",null,_loc3_[_loc2_].name);
         _loc2_ = _loc2_ + 1;
      }
      this.PanelSpace.send("onReload");
   }
   function doUnload()
   {
      this.selectedApplication = null;
      this.PanelSpace.send("onSetApp",null);
      var _loc5_ = this.appList.selectedItems;
      var _loc4_ = 0;
      while(_loc4_ < _loc5_.length)
      {
         var _loc3_ = _loc5_[_loc4_].name;
         this.__get__fc().call(this.__server,"unloadApp",null,_loc3_);
         this.infoArray[_loc3_] = null;
         delete this.infoArray[_loc3_];
         this.appList.removeItemAt(this.DC_1.getByID(_loc3_).id);
         _global.dat_c.callOnProfile(this.__server,"clearApplication",_loc3_);
         this.DC_1.killByID(_loc3_);
         _loc4_ = _loc4_ + 1;
      }
      this.updateUI();
   }
   function onChange()
   {
      if(this.onEnterClip != null)
      {
         if(this.appList.selectedIndex != this.onEnterClip._parent.id)
         {
            this.appList.selectedIndex = this.onEnterClip._parent.id;
            this.onEnterClip.editMode();
         }
         return undefined;
      }
      if(this.selectedApplication != this.appList.selectedItem.name)
      {
         this.selectedApplication = this.appList.selectedItem.name;
         this.PanelSpace.send("onSetApp",this.selectedApplication);
         this.updateUI();
      }
      if(this.appList.selectedItem && this.ss3._visible != true)
      {
         this.ss1.text = this.appList.selectedItem.name;
         this.ss2.text = " - " + this.tabs.selectedItem.label;
         this.moveText();
      }
   }
   function onLogout()
   {
      this.appList.removeAll();
   }
   function onSetServer(evt)
   {
      if(evt.node.type != "vhost" || _global.conn.getFC(evt.node.nodeid).adminLevel.vhost == evt.node.label)
      {
         this.isConnectedVHost = true;
         this.setServer(evt.node.nodeid);
      }
      else
      {
         this.isConnectedVHost = false;
         this.selectedVHostLabel = evt.node.label;
         this.__server = undefined;
         this.setServer(undefined);
      }
   }
   function setServer(sID)
   {
      this.killNewInst();
      this.__server = sID;
      this.__get__fc().call(sID,"getApps",new this.ResBind(this.onGetApps,this),true,true);
      var _loc2_ = 0;
      while(_loc2_ < this.appList.length)
      {
         var _loc3_ = this.appList.getItemAt(_loc2_).name;
         this.newInstTemp[_loc3_] = null;
         delete this.newInstTemp[_loc3_];
         _loc2_ = _loc2_ + 1;
      }
      this.appList.removeAll();
      this.DC_1.clear();
      this.selectedApplication = null;
      this.PanelSpace.send("onAppsReset",this.__server);
      this.PanelSpace.send("onSetServer",this.__server);
      this.PanelSpace.send("onSetApp",this.selectedApplication);
      this.updateUI();
      this.onRefresh();
   }
   function onSetTab(evt)
   {
      this.PanelSpace.show(evt.data);
      this.PanelSpace.send("onSetServer",this.__server);
      this.PanelSpace.send("onSetApp",this.selectedApplication);
      this.__get__Cache().setProp("application/lastTabLabel",evt.data);
      this.updateUI();
   }
   function killNewInst()
   {
      this.onEnterClip.staticMode();
      this.appList.removeItemAt(this.appList.selectedIndex);
      this.onEnterClip = null;
      if(this.appList.length == 0)
      {
         this.selectedApplication = null;
      }
      this.showBase(true);
      this.updateUI();
      if(this.appList.selectedItem)
      {
         this.ss1.text = this.appList.selectedItem.name;
         this.ss2.text = " - " + this.tabs.selectedItem.label;
      }
      else
      {
         this.ss1.text = "";
         this.ss2.text = "";
      }
      this.moveText();
      if(this.appList.length == 0)
      {
         this.ss4.text = "Please load an application";
      }
      else
      {
         this.ss4.text = "Please select an application";
      }
      this.na_combo.activateButton();
   }
   function onNewApp()
   {
      if(this.onEnterClip == null)
      {
         var _loc5_ = this.na_combo.selectedItem.label;
         var _loc3_ = this.na_combo.label_txt.text;
         var _loc4_ = undefined;
         if(_loc3_.indexOf("/") != -1)
         {
            if(("," + this.appsArray.toString() + ",").indexOf(_loc3_.split("/")[0]) == -1)
            {
               this.onError("Application " + _loc3_.split("/")[0] + " does not exist");
               return false;
            }
            _loc4_ = this.appList.addItem({name:_loc3_,cc:"--"});
         }
         else
         {
            _loc4_ = this.appList.addItem({name:_loc5_ + "/_definst_",cc:"--"});
         }
         this.appList.selectedIndex = _loc4_.id;
         this.na_combo.clearSelection();
         this.onEnterClip = _loc4_.getChild("name");
         _global.fm.doFocus(this.appList);
         this.appTemp[_loc5_] = _loc4_;
         this.showBase(false);
         this.ss1.text = _loc5_;
         this.ss2.text = "New Instance";
         this.moveText();
         Key.addListener(this.kListner);
         this.onEnterClip.editMode();
         if(_loc3_.indexOf("/") != -1)
         {
            this.onEnter();
         }
         this.na_combo.label_txt.onChanged = function()
         {
         };
         this.na_combo.label_txt.type = "dynamic";
         this.na_combo.label_txt.selectable = false;
         this.na_combo.label_txt.text = "New Instance...";
         if(_loc3_.indexOf("/") == -1)
         {
            this.na_combo.deactivateButton();
         }
      }
   }
   function onEnter()
   {
      var _loc2_ = this.onEnterClip.getData();
      if(this.DC_1.getByID(_loc2_))
      {
         this.onError("Application: " + _loc2_ + " is already running");
         this.onEnterClip.editMode();
      }
      else
      {
         Key.removeListener(this.kListner);
         this.onEnterClip.staticMode();
         this.DC_1.__store[_loc2_] = this.appTemp[_loc2_.split("/")[0]];
         this.appList.selectedIndex = this.appTemp[_loc2_.split("/")[0]].id;
         this.newInstTemp[_loc2_] = true;
         this.appTemp[_loc2_.split("/")[0]] = null;
         delete this.appTemp[_loc2_.split("/")[0]];
         this.onEnterClip = null;
         this.__get__fc().call(this.__server,"reloadApp",new this.ResBind(this.onAppLoad,this,_loc2_),_loc2_);
         this.showBase(true);
         this.onChange();
      }
      if(this.appList.length == 0)
      {
         this.ss4.text = "Please load an application";
      }
      else
      {
         this.ss4.text = "Please select an application";
      }
      this.na_combo.activateButton();
   }
   function showBase(b)
   {
      this.ss3._visible = !b;
      this.tabs._visible = b;
      this.reloadBtn._visible = b;
      this.killBtn._visible = b;
      if(b == true)
      {
         this.ss4._visible = this.ss4.isVisible;
         this.PanelSpace._visible = !this.ss4.isVisible;
         this.kdb._visible = this.kdb.isVisible;
      }
      else
      {
         this.PanelSpace._visible = false;
         this.ss4._visible = false;
         this.kdb._visible = false;
      }
   }
   function onRefresh()
   {
      if(this.__server != undefined && _global.cm.isConnected(this.__server))
      {
         this.__get__fc().call(this.__server,"getActiveInstances",new this.ResBind(this.onGetInstances,this));
      }
      else
      {
         this.na_combo.removeAll();
      }
   }
   function onActivate()
   {
      var _loc3_ = _global.tabOffset;
      this.appList.tabIndex = _loc3_;
      this.na_combo.tabIndex = _loc3_ + 1;
      this.tabs.tabStart = _loc3_ + 2;
      this.PanelSpace.show(this.__get__Cache().getProp("application/lastTabLabel","log"));
      this.__get__fc().call(this.__server,"getApps",new this.ResBind(this.onGetApps,this),true,true);
      this.selectedApplication = null;
      this.PanelSpace.send("onSetServer",this.__server);
      this.updateUI();
   }
   function updateUI()
   {
      if(this.appList.selectedItem.name && !this.selectedApplication)
      {
         this.selectedApplication = this.appList.selectedItem.name;
      }
      if(!this.selectedApplication || !_global.cm.isConnected(this.__server))
      {
         this.PanelSpace._visible = false;
         this.tabs._visible = false;
         this.reloadBtn._visible = false;
         this.killBtn._visible = false;
         this.ss4._visible = !this.ss3._visible;
         this.ss4.isVisible = true;
         this.ss1._visible = this.ss2._visible = this.ss3._visible;
      }
      else
      {
         this.PanelSpace._visible = !this.ss3._visible;
         this.tabs._visible = !this.ss3._visible;
         this.reloadBtn._visible = !this.ss3._visible;
         this.killBtn._visible = !this.ss3._visible;
         this.ss4._visible = false;
         this.ss4.isVisible = false;
         this.ss1._visible = this.ss2._visible = true;
      }
      if(this.__server == undefined)
      {
         if(this.isConnectedVHost == false)
         {
            this.ss4.text = "You are not logged into Vhost:" + this.selectedVHostLabel + "\nPlease make a separate server connection to it for managing its applications. ";
         }
         else
         {
            this.ss4.text = "Attempting to connect... If nothing happens after a few seconds, \nplease go to the Manage Servers panel and connect the server there.";
         }
      }
      else if(!_global.cm.isConnected(this.__server))
      {
         this.ss4.text = "Attempting to connect... If nothing happens after a few seconds, \nplease go to the Manage Servers panel and connect the server there.";
      }
      else if(this.appList.length == 0)
      {
         this.ss4.text = "Please load an application";
      }
      else
      {
         this.ss4.text = "Please select an application";
      }
      this.checkDebug();
   }
   function onDeactivate()
   {
      this.tabs.clearTab();
      this.clearTab(this.appList);
   }
   function drawPanels()
   {
      this.PanelSpace._y = 70;
      this.PanelSpace.registerPanel("log","Apps_Live_Log");
      this.PanelSpace.registerPanel("clients","Apps_Clients");
      this.PanelSpace.registerPanel("sharedobjects","Apps_SharedObjects");
      this.PanelSpace.registerPanel("streams","Apps_Streams");
      this.PanelSpace.registerPanel("performance","Apps_Performance");
      this.nextTab(this.appList);
      this.nextTab(this.na_combo);
      this.nextTab(this.tabs.getItemAt(0));
      this.nextTab(this.tabs.getItemAt(1));
      this.nextTab(this.tabs.getItemAt(2));
      this.nextTab(this.tabs.getItemAt(3));
      this.nextTab(this.tabs.getItemAt(4));
      this.nextTab(this.reloadBtn);
      this.nextTab(this.killBtn);
      this.nextTab(this.kdb);
   }
   function onNewItem(name, type)
   {
      if(this.newInstTemp[name])
      {
         var _loc3_ = this.newInstTemp[name];
         this.newInstTemp[name] = null;
         delete this.newInstTemp[name];
         if(this.selectedApplication == null)
         {
            this.appList.selectedIndex = 0;
            this.onChange();
            this.selectedApplication = this.appList.selectedItem.name;
            this.updateUI();
         }
         this.onItemPersist(name,type,_loc3_);
         return _loc3_;
      }
      _loc3_ = this.appList.addItem({name:name,cc:"--"});
      if(this.selectedApplication == null)
      {
         this.appList.selectedIndex = 0;
         this.onChange();
         this.selectedApplication = this.appList.selectedItem.name;
         this.updateUI();
      }
      else
      {
         this.PanelSpace.send("onSetApp",name);
         this.updateUI();
      }
      this.onItemPersist(name,type,_loc3_);
      return _loc3_;
   }
   function onItemPersist(name, type, data)
   {
      this.__get__fc().call(this.__server,"getInstanceStats",new this.ResBind(this.onAppStat,this,data),name);
   }
   function onLostItem(name, type)
   {
      if(!this.newInstTemp[name])
      {
         var _loc3_ = 0;
         while(_loc3_ < this.appList.length)
         {
            if(this.appList.getItemAt(_loc3_).name == name)
            {
               this.appList.removeItemAt(_loc3_);
               this.infoArray[name] = null;
               delete this.infoArray[name];
               _global.dat_c.callOnProfile(this.__server,"clearApplication",name);
               break;
            }
            _loc3_ = _loc3_ + 1;
         }
      }
      return true;
   }
   function onGetApps(result)
   {
      if(result.level == "status")
      {
         this.appsArray = new Array();
         this.na_combo.removeAll();
         var _loc2_ = 0;
         while(_loc2_ < result.data.length)
         {
            if(result.data[_loc2_].indexOf("total_apps") == -1)
            {
               this.na_combo.addItem({label:result.data[_loc2_]});
               this.appsArray.push(result.data[_loc2_]);
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function onAppStat(result, data)
   {
      if(result.level == "status")
      {
         for(var _loc5_ in result.data)
         {
            if(_loc5_ == "connected")
            {
               data.cc = result.data[_loc5_];
            }
            else if(typeof result.data[_loc5_] == "object")
            {
               for(var _loc4_ in result.data[_loc5_])
               {
                  if(_loc4_ == "connected")
                  {
                     data.cc = result.data[_loc5_][_loc4_];
                  }
               }
            }
         }
         if(this.infoArray[data.name] == null)
         {
            this.infoArray[data.name] = {};
         }
         this.infoArray[data.name].debug = result.data.debug;
      }
   }
   function onGetInstances(result)
   {
      if(result.level == "status")
      {
         this.DC_1.onData(result.data);
      }
      if(this.appList.length == 0)
      {
         this.ss4.text = "Please load an application";
      }
      else
      {
         this.ss4.text = "Please select an application";
      }
   }
   function onAppLoad(result, app)
   {
      if(result.level != "status")
      {
         var _loc2_ = this.DC_1.__store[app];
         this.appList.removeItemAt(_loc2_.id);
         delete this.DC_1.__store[app];
         delete this.newInstTemp[app];
      }
   }
   function moveText()
   {
      this.ss1._x = this.xOffset + 20;
      this.ss2._x = this.ss1._x + this.ss1.width;
   }
   function setSize(w, h)
   {
      this.__width = w;
      this.__height = h;
      this.backing.clear();
      this.drawRect(this.backing,this.xOffset,0,w - this.xOffset,h,16777215,30,4);
      this.tabs._x = this.xOffset + 7;
      this.kdb._x = w - 105;
      if(w < 760)
      {
         this.kdb._visible = false;
      }
      else if(this.ss3._visible == true)
      {
         this.kdb._visible = false;
      }
      else
      {
         this.kdb._visible = this.kdb.isVisible;
      }
      this.reloadBtn._x = this.xOffset + 7 + 431 + 7;
      this.killBtn._x = this.xOffset + 7 + 431 + 7 + 26;
      this.PanelSpace._x = this.xOffset;
      this.PanelSpace.setSize(w - this.xOffset,h - 70);
      this.seperator._y = h / 2 - this.seperator._height / 2;
      this.seperator._x = this.xOffset - 7;
      this.na_combo._y = h - 28;
      if(this.xOffset > 5)
      {
         this.appList.setSize(this.xOffset - 9,h - 59);
         this.drawRect(this.backing,0,0,this.xOffset - 9,this.__height,16777215,20,4);
         this.clusterTree.setSize(this.xOffset - 5);
         this.na_combo.listHeight = h - 200;
         this.na_combo.setSize(this.xOffset - 86,24);
         this.na_combo.listWidth = this.xOffset - 19;
         this.seperator.gotoAndStop(1);
      }
      else
      {
         this.seperator._x = 0;
         this.appList._visible = this.clusterTree._visible = this.na_combo._visible = false;
         this.seperator.gotoAndStop(2);
      }
      this.ss3._x = this.xOffset + 20;
      this.ss4._x = this.xOffset + 20;
   }
}
