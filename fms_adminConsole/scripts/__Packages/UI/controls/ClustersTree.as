class UI.controls.ClustersTree extends UI.core.events
{
   function ClustersTree()
   {
      super();
      this.__clusters = new Array();
      this.__serverCount = 0;
      this.__firstDraw = true;
      this.__showCheckBoxes = false;
      this.__selectFirstChild = false;
      this.__nodes = new Array();
      this.selFlag = true;
      this.attachMovie("Tree","cTree",0);
      _global.cm.addListener("change",this.onClusterChange,this);
      this.cTree.addListener("change",this.onSelect,this);
      this.cTree.addListener("onExpand",this.onExpand,this);
   }
   function get serverCount()
   {
      return this.__serverCount;
   }
   function get nodes()
   {
      return this.__nodes;
   }
   function set showCheckBoxes(show)
   {
      this.__showCheckBoxes = show;
   }
   function set selectFirstChild(select)
   {
      this.__selectFirstChild = select;
   }
   function get selectedNode()
   {
      return this.__selectedNode;
   }
   function get height()
   {
      return this.__height;
   }
   function get width()
   {
      return this.__width;
   }
   function get bottomY()
   {
      return this.cTree.bottomY;
   }
   function onClusterChange(data)
   {
      var _loc7_ = this.__get__Clusters().getClusterList();
      var _loc8_ = _global.l_cache.getProp("singletonServers");
      var _loc5_ = new Object();
      _loc5_.length = 0;
      _loc5_.clusters = new Array();
      _loc5_.singles = new Array();
      var _loc4_ = 0;
      while(_loc4_ < _loc8_.length)
      {
         _loc5_.length = _loc5_.length + 1;
         _global.cm["get"]("a" + _loc4_,this.onServerData,this,_loc5_);
         _loc4_ = _loc4_ + 1;
      }
      var _loc3_ = 0;
      while(_loc3_ < _loc7_.length)
      {
         var _loc6_ = _loc7_[_loc3_];
         _loc5_.length = _loc5_.length + 1;
         _global.cm["get"](_loc6_,this.onServerData,this,_loc5_);
         _loc3_ = _loc3_ + 1;
      }
   }
   function onServerData(result)
   {
      var _loc2_ = result.data;
      _loc2_.length = _loc2_.length - 1;
      if(result.cID.indexOf("a") == -1)
      {
         _loc2_.clusters.push(result);
      }
      else
      {
         _loc2_.singles.push(result);
      }
      if(_loc2_.length == 0)
      {
         this.drawFromQue(_loc2_);
      }
   }
   function onKeyDown()
   {
      this.cTree.onKeyDown();
   }
   function drawFromQue(queData)
   {
      var _loc17_ = this.cTree.selectedItem.nodeid;
      var _loc19_ = this.cTree.selectedItem.type;
      var _loc18_ = this.cTree.selectedItem.connected;
      this.cTree.removeAll();
      this.__serverCount = 0;
      this.__nodes = new Array();
      var _loc16_ = queData.singles;
      var _loc7_ = 0;
      while(_loc7_ < _loc16_.length)
      {
         var _loc2_ = _loc16_[_loc7_];
         var _loc12_ = !_loc2_.connected ? "icon_list_Server_unconnected" : "icon_list_Server_connected";
         var _loc5_ = this.cTree.addTreeNode({label:_loc2_.label,icon:_loc12_,nodeid:_loc2_.sID,type:"server",connected:_loc2_.connected});
         this.__serverCount = this.__serverCount + 1;
         this.__nodes.push(_loc5_);
         if(this.__showCheckBoxes)
         {
            _loc5_.icon = "CheckBox";
            _loc5_.IconSpace.selected = false;
         }
         var _loc6_ = _loc2_.vHosts;
         var _loc4_ = 0;
         while(_loc4_ < _loc6_.length)
         {
            var _loc3_ = _loc5_.addTreeNode({label:_loc6_[_loc4_],icon:"icon_list_vHost",nodeid:_loc2_.sID,type:"vhost",connected:_loc2_.connected});
            if(this.__showCheckBoxes)
            {
               _loc3_.icon = "CheckBox";
               _loc3_.IconSpace.selected = false;
            }
            this.__nodes.push(_loc3_);
            _loc4_ = _loc4_ + 1;
         }
         _loc7_ = _loc7_ + 1;
      }
      var _loc15_ = queData.clusters;
      _loc15_.sortOn("label");
      var _loc8_ = 0;
      while(_loc8_ < _loc15_.length)
      {
         var _loc14_ = _loc15_[_loc8_];
         this.drawCluster(_loc14_);
         _loc8_ = _loc8_ + 1;
      }
      this.cTree.restoreExpandState();
      if(this.autoOveride)
      {
         this.cTree.selectFirstItem("nodeid",this.autoOveride,this.conValidate2,"server");
         this.autoOveride = null;
      }
      else if(!_loc17_)
      {
         var _loc22_ = this.cTree.selectFirstItem("type","server",this.conValidate);
      }
      else if(_loc18_ != false)
      {
         _loc22_ = this.cTree.selectFirstItem("nodeid",_loc17_,this.conValidate2,_loc19_);
      }
      this.dispatchEvent("redraw",{target:this});
   }
   function conValidate(row)
   {
      if(row.icon == "icon_list_Server_connected")
      {
         return true;
      }
      return false;
   }
   function conValidate2(row, val, val2)
   {
      if(row.nodeid == val && row.type == val2)
      {
         return true;
      }
      return false;
   }
   function drawCluster(data)
   {
      var _loc14_ = this.cTree.addTreeNode({label:data.label,icon:"icon_List_Cluster",nodeid:data.cID,type:"cluster"});
      this.__nodes.push(_loc14_);
      if(this.__showCheckBoxes)
      {
         _loc14_.icon = "CheckBox";
         _loc14_.IconSpace.selected = false;
      }
      var _loc7_ = 0;
      while(_loc7_ < data.servers.length)
      {
         var _loc2_ = data.servers[_loc7_];
         var _loc11_ = !_loc2_.connected ? "icon_list_Server_unconnected" : "icon_list_Server_connected";
         var _loc5_ = _loc14_.addTreeNode({label:_loc2_.label,icon:_loc11_,nodeid:_loc2_.sID,type:"server",connected:_loc2_.connected});
         this.__serverCount = this.__serverCount + 1;
         this.__nodes.push(_loc5_);
         if(this.__showCheckBoxes)
         {
            _loc5_.icon = "CheckBox";
            _loc5_.IconSpace.selected = false;
         }
         var _loc6_ = _loc2_.vHosts;
         var _loc4_ = 0;
         while(_loc4_ < _loc6_.length)
         {
            var _loc3_ = _loc5_.addTreeNode({label:_loc6_[_loc4_],icon:"icon_list_vHost",nodeid:_loc2_.sID,type:"vhost",connected:_loc2_.connected});
            if(this.__showCheckBoxes)
            {
               _loc3_.icon = "CheckBox";
               _loc3_.IconSpace.selected = false;
            }
            this.__nodes.push(_loc3_);
            _loc4_ = _loc4_ + 1;
         }
         _loc7_ = _loc7_ + 1;
      }
   }
   function onSelect(data)
   {
      this.__selectedNode = data.node;
      this.dispatchEvent("change",{target:this,node:data.node});
   }
   function onExpand(data)
   {
      this.dispatchEvent("onExpand",{target:this,node:data.node});
   }
   function setSize(width, height)
   {
      this.__width = width;
      this.__height = height;
      this.cTree.setSize(this.__width,this.__height);
   }
}
