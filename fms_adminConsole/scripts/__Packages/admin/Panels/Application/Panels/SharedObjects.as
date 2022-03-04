class admin.Panels.Application.Panels.SharedObjects extends admin.panel
{
   function SharedObjects()
   {
      super();
      this.addControl("DataGrid","soGrid",0);
      this.manageClip(this.soGrid,{width:"246",height:"100%"});
      this.soGrid.rowColors = [15595519,16777215];
      this.soGrid.addColumn("name","Name",106,"SharedObject name",3);
      this.soGrid.addColumn("type","Type",47,"Type: Temp or Stored",3);
      this.soGrid.addColumn("cons","Connections",82,"Number of active connections",3);
      this.soGrid.addListener("change",this.onChange,this);
      this.addControl("Tree","soTree",1,{_y:15,_x:253});
      this.manageClip(this.soTree,{width:"-253",height:"-15"});
      this.soTree.addListener("change",this.onTreeChange,this);
      this.soTree.addListener("onExpand",this.onTreeExpand,this);
      this.attachMovie("DataGrid_Dragger","soTreeHead",2);
      this.soTreeHead._x = 253;
      this.soTreeHead.label = "Properties";
      this.soTreeHead.bgGrad.gotoAndStop(1);
      this.manageClip(this.soTreeHead,{width:"-253",height:"16"});
      this.addControl("Label","noDataLabel",3,{autoSize:"left",text:"No Data"});
      this.noDataLabel.setFormat("color",11977933);
      this.noDataLabel.setFormat("size",15);
      this.noDataLabel.setFormat("bold",true);
      this.DC_1 = new admin.general.DataCompare();
      this.DC_1.owner = this;
      this.DC_1.type = "Stored";
      this.DC_2 = new admin.general.DataCompare();
      this.DC_2.owner = this;
      this.DC_2.type = "Temp";
      this.dumpHistory = new Object();
      this.nodeRef = new Object();
   }
   function firstDraw()
   {
      this.nextTab(this.soGrid);
      this.nextTab(this.soTree);
   }
   function onTreeChange(evt)
   {
      this.dumpHistory.selected = evt.node.evl;
   }
   function onTreeExpand(evt)
   {
      this.dumpHistory[evt.node.evl] = evt.node.isOpen;
   }
   function onRefresh()
   {
      this.__get__fc().call(this.__get__server(),"getSharedObjects",new this.ResBind(this.onSOData,this),this.__get__app());
   }
   function onChange(data)
   {
      _global.conn.enterDebugMode(this.__get__server(),this.__get__app(),this.onGetDC,this);
   }
   function onGetDC(dc)
   {
      if(dc.isConnected == true)
      {
         var _loc5_ = true;
         if(this.soGrid.selectedItem.type == "Temp")
         {
            _loc5_ = false;
         }
         var o = this;
         this.exploreSO.close();
         this.exploreSO = SharedObject.getRemote(this.soGrid.selectedItem.name,dc.uri,_loc5_);
         this.nodeRef = new Object();
         this.soTree.removeAll();
         this.exploreSO.onSync = function(dat)
         {
            var _loc1_ = 0;
            while(_loc1_ < dat.length)
            {
               var _loc2_ = dat[_loc1_];
               if(_loc2_.name)
               {
                  o.mapToTree(o.exploreSO.data,_loc2_);
               }
               _loc1_ = _loc1_ + 1;
            }
            o.noDataLabel._visible = o.__width > 320;
            o.noDataLabel.isVisible = true;
            for(var _loc4_ in o.exploreSO.data)
            {
               o.noDataLabel._visible = false;
               o.noDataLabel.isVisible = false;
               break;
            }
         };
         this.exploreSO.connect(dc.nc);
      }
      else
      {
         this.onError("Failed to make a debug connection, please check that the application is in debug mode");
      }
   }
   function onReload()
   {
      this.soGrid.removeAll();
      this.DC_1.clear();
      this.DC_2.clear();
      this.nodeRef = new Object();
      this.soTree.removeAll();
   }
   function mapToTree(data, ref)
   {
      var o = data[ref.name];
      var t = typeof o;
      if(ref.code == "delete")
      {
         for(var i in this.nodeRef)
         {
            if(eval("data." + i) == undefined)
            {
               this.nodeRef[i].owner.removeTreeNodeAt(this.nodeRef[i].id);
               delete this.nodeRef[i];
            }
         }
      }
      else
      {
         if(this.nodeRef[ref.name])
         {
            if(t == "object")
            {
               this.processObject(o,ref.name);
            }
            else
            {
               var cnode = this.nodeRef[ref.name];
               cnode.dataString = this.getString(ref.name,o,t);
               cnode.type = this.getType(o);
               cnode.icon = this.getIcon(o);
            }
         }
         else if(t == "object")
         {
            var node = this.soTree.addTreeNode({render:"SharedObjects_Tree_Render",type:this.getType(o),dataString:ref.name,evl:ref.name,icon:this.getIcon(o)},false);
            this.nodeRef[ref.name] = node;
            this.processObject(o,ref.name);
         }
         else
         {
            var l = this.getString(ref.name,o,t);
            var cnode = this.soTree.addTreeNode({render:"SharedObjects_Tree_Render",type:this.getType(o),dataString:l,evl:ref.name,icon:this.getIcon(o)},false);
            this.nodeRef[ref.name] = cnode;
         }
         this.soTree.redraw(0);
      }
   }
   function processObject(obj, evaluate)
   {
      for(var _loc14_ in obj)
      {
         var _loc2_ = obj[_loc14_];
         var _loc4_ = typeof _loc2_;
         if(this.nodeRef[evaluate + "." + _loc14_])
         {
            if(_loc4_ == "object")
            {
               this.processObject(_loc2_,evaluate + "." + _loc14_);
            }
            else
            {
               var _loc7_ = this.nodeRef[evaluate + "." + _loc14_];
               _loc7_.dataString = this.getString(_loc14_,_loc2_,_loc4_);
               _loc7_.type = this.getType(_loc2_);
               _loc7_.icon = this.getIcon(_loc2_);
            }
         }
         else
         {
            var _loc5_ = this.nodeRef[evaluate];
            if(_loc4_ == "object")
            {
               _loc7_ = _loc5_.addTreeNode({render:"SharedObjects_Tree_Render",type:this.getType(_loc2_),dataString:_loc14_,evl:evaluate + "." + _loc14_,icon:this.getIcon(_loc2_)},false);
               this.nodeRef[evaluate + "." + _loc14_] = _loc7_;
               this.processObject(_loc2_,evaluate + "." + _loc14_);
            }
            else
            {
               var _loc6_ = this.getString(_loc14_,_loc2_,_loc4_);
               _loc7_ = _loc5_.addTreeNode({render:"SharedObjects_Tree_Render",type:this.getType(_loc2_),dataString:_loc6_,evl:evaluate + "." + _loc14_,icon:this.getIcon(_loc2_)},false);
               this.nodeRef[evaluate + "." + _loc14_] = _loc7_;
            }
         }
      }
   }
   function getString(i, o, t)
   {
      var _loc1_ = "(" + i + ", ";
      if(t == "string")
      {
         _loc1_ += "\"" + o + "\"";
      }
      else if(t == "Boolean")
      {
         if(o == true)
         {
            _loc1_ += "True";
         }
         else
         {
            _loc1_ += "False";
         }
      }
      else
      {
         _loc1_ += o.toString();
      }
      _loc1_ += ")";
      return _loc1_;
   }
   function getType(obj)
   {
      var _loc2_ = typeof obj;
      var _loc1_ = "";
      if(_loc2_ == "object")
      {
         if(obj instanceof Array)
         {
            var _loc4_ = "Array";
            _loc1_ = "(" + _loc4_.slice(0,1).toUpperCase() + _loc4_.slice(1,_loc4_.length) + ")";
         }
         else if(obj instanceof XML)
         {
            _loc4_ = "XML";
            _loc1_ = "(" + _loc4_.slice(0,1).toUpperCase() + _loc4_.slice(1,_loc4_.length) + ")";
         }
         else if(obj instanceof XMLSocket)
         {
            _loc4_ = "XMLSocket";
            _loc1_ = "(" + _loc4_.slice(0,1).toUpperCase() + _loc4_.slice(1,_loc4_.length) + ")";
         }
         else if(obj instanceof XMLNode)
         {
            _loc4_ = "XMLNode";
            _loc1_ = "(" + _loc4_.slice(0,1).toUpperCase() + _loc4_.slice(1,_loc4_.length) + ")";
         }
         else if(obj instanceof Date)
         {
            _loc4_ = "Date";
            _loc1_ = "(" + _loc4_.slice(0,1).toUpperCase() + _loc4_.slice(1,_loc4_.length) + ")";
         }
         else if(obj instanceof NetConnection)
         {
            _loc4_ = "NetConnection";
            _loc1_ = "(" + _loc4_.slice(0,1).toUpperCase() + _loc4_.slice(1,_loc4_.length) + ")";
         }
      }
      _loc2_ = _loc2_.substr(0,1).toUpperCase() + _loc2_.slice(1,_loc2_.length) + " " + _loc1_ + ":";
      return "<font size=\"10\" face=\"Verdana\" color=\"#656565\">" + _loc2_ + "</font><font size=\"10\" face=\"Verdana\" color=\"#000000\">";
   }
   function getIcon(obj)
   {
      var _loc1_ = typeof obj;
      return "so_ico_" + _loc1_;
   }
   function onSOData(result)
   {
      if(result.level == "status")
      {
         var _loc2_ = result.data;
         this.DC_1.onData(_loc2_.persistent);
         this.DC_2.onData(_loc2_.volatile);
      }
   }
   function onNewItem(name, type)
   {
      var _loc2_ = this.soGrid.addItem({name:name,type:type,cons:"--"});
      this.onItemPersist(name,type,_loc2_);
      return _loc2_;
   }
   function onItemPersist(name, type, data)
   {
      var _loc2_ = true;
      if(type == "Temp")
      {
         _loc2_ = false;
      }
      this.__get__fc().call(this.__get__server(),"getSharedObjectStats",new this.ResBind(this.onSoStat,this,data),this.__get__app(),name,_loc2_);
   }
   function onSoStat(result, row)
   {
      if(result.level == "status")
      {
         row.cons = result.data.connected;
      }
   }
   function onLostItem(name, type)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.soGrid.length)
      {
         var _loc3_ = this.soGrid.getItemAt(_loc2_);
         if(_loc3_.name == name && _loc3_.type == type)
         {
            this.soGrid.removeItemAt(_loc2_);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function onLogout()
   {
      this.onReload();
   }
   function onSetApp(newApp)
   {
      var _loc2_ = this.__get__app();
      this.soGrid.removeAll();
      this.DC_1.clear();
      this.DC_2.clear();
      this.nodeRef = new Object();
      this.soTree.removeAll();
      this.exploreSO.close();
      this.onRefresh();
   }
   function onSetServer(sID)
   {
      this.soGrid.removeAll();
      this.soTree.removeAll();
      this.nodeRef = new Object();
      this.DC_1.clear();
      this.DC_2.clear();
      this.onRefresh();
   }
   function setSize(w, h)
   {
      this.__width = w;
      this.tBorder.clear();
      this.tBorder.lineStyle(1,8625087,100);
      this.drawRect(this.tBorder,0,0,w - 253,h - 15,16777215,20);
      this.noDataLabel._x = 253 + (w - 253) / 2 - this.noDataLabel.width / 2;
      this.noDataLabel._y = h / 2 - this.noDataLabel.height / 2;
      if(w < 320)
      {
         this.noDataLabel._visible = false;
      }
      else
      {
         this.noDataLabel._visible = this.noDataLabel.isVisible;
      }
      if(w < 12)
      {
         this.soGrid._visible = false;
      }
      else
      {
         this.soGrid._visible = true;
      }
   }
}
