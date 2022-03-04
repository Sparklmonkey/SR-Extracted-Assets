class admin.Panels.Application.Panels.Streams extends admin.panel
{
   function Streams()
   {
      super();
      this.addControl("DataGrid","stGrid",0);
      this.manageClip(this.stGrid,{width:"246",height:"-30"});
      this.stGrid.rowColors = [15595519,16777215];
      this.stGrid.addListener("change",this.onRefresh,this);
      this.stGrid.addColumn("name","Name",120,"Stream name",2);
      this.stGrid.addColumn("type","Type",115,"Type of stream: NetStream, Live Stream, or Stored Stream",2);
      this.stGrid.setRender("name","Stream_DG_Render");
      this.addControl("Button","playBtn",1,{width:83,height:24,label:"Play Stream"});
      this.manageClip(this.playBtn,{x:"-86",y:"-27"});
      this.playBtn.addListener("click",this.onClick,this);
      this.addControl("DataGrid","cGrid",2,{_y:15,_x:253});
      this.cGrid.rowColors = [15595519,16777215];
      this.v1MC = this.cGrid.addColumn("v1","Properties",120,"Stream Properties");
      this.v2MC = this.cGrid.addColumn("v2","Values",255,"Property values");
      this.manageClip(this.cGrid,{width:"-253",height:"-45"});
      this.attachMovie("DataGrid_Dragger","cHead",3);
      this.cHead._x = 253;
      this.cHead.label = "Stream Data";
      this.cHead.bgGrad.gotoAndStop(1);
      this.manageClip(this.cHead,{width:"-253",height:"16"});
      this.sWindow = _root.createEmptyMovieClip("sWindow",50);
      this.DC_1 = new admin.general.DataCompare();
      this.DC_1.owner = this;
      this.DC_1.type = "Stored";
      this.DC_2 = new admin.general.DataCompare();
      this.DC_2.owner = this;
      this.DC_2.type = "Live";
      this.DC_3 = new admin.general.DataCompare();
      this.DC_3.owner = this;
      this.DC_3.type = "NetStream";
      this.streamWindows = new Array();
      this.sCount = 0;
   }
   function firstDraw()
   {
      this.nextTab(this.stGrid);
      this.nextTab(this.cGrid);
      this.nextTab(this.playBtn);
   }
   function onLogout()
   {
      this.stGrid.removeAll();
   }
   function onRecStat(info, n)
   {
      if(info.level == "status")
      {
         var _loc3_ = info.data.length / 1000;
         _global.conn.enterDebugMode(this.__get__server(),this.__get__app(),this.onGetDC,this,n,_loc3_);
      }
      else
      {
         this.onError("Failed to retreive recorded stream data: " + n);
      }
   }
   function onNSStat(result, id)
   {
      if(result.level == "status")
      {
         if(result.data.length == 1 && result.data[0].name != "")
         {
            var _loc3_ = result.data[0];
            if(_loc3_.type == "paused recorded" || _loc3_.type == "playing recorded")
            {
               this.__get__fc().call(this.__get__server(),"getRecordedStreamStats",new this.ResBind(this.onRecStat,this,_loc3_.name),this.__get__app(),_loc3_.name);
            }
            else
            {
               _global.conn.enterDebugMode(this.__get__server(),this.__get__app(),this.onGetDC,this,_loc3_.name);
            }
         }
         else
         {
            this.onError("Failed to play NetStream: " + id + " is idle");
         }
      }
      else
      {
         this.onError("Failed to retreive NetStream data: " + id);
      }
   }
   function onClick()
   {
      if(this.stGrid.selectedItem.type == "Stored")
      {
         this.__get__fc().call(this.__get__server(),"getRecordedStreamStats",new this.ResBind(this.onRecStat,this,this.stGrid.selectedItem.name),this.__get__app(),this.stGrid.selectedItem.name);
      }
      else if(this.stGrid.selectedItem.type == "Live")
      {
         _global.conn.enterDebugMode(this.__get__server(),this.__get__app(),this.onGetDC,this,this.stGrid.selectedItem.name);
      }
      else
      {
         this.__get__fc().call(this.__get__server(),"getNetStreamStats",new this.ResBind(this.onNSStat,this,this.stGrid.selectedItem.name),this.__get__app(),[this.stGrid.selectedItem.name]);
      }
   }
   function onGetDC(dc, stream, len)
   {
      if(dc.isConnected == true)
      {
         var mc = this.sWindow.attachMovie("InfoBox","i" + this.sCount,this.sCount);
         this.sCount = this.sCount + 1;
         mc.content = "StreamPlayer";
         mc.title = stream;
         mc.setSize(200,200);
         mc.content.__owner = mc;
         mc.content.addListener("onGetAspect",this.onAspect,this);
         mc.content.connect(dc.nc);
         mc.content.play(stream);
         mc.onKillBox = function()
         {
            mc.removeMovieClip();
         };
         if(len)
         {
            mc.content.length = len;
         }
      }
      else
      {
         this.onError("Failed to play stream: " + stream + ", no debug connection possible");
      }
   }
   function killPlayer(mc)
   {
      mc.stopDown();
      mc.removeMovieClip();
   }
   function onAspect(data)
   {
      var _loc1_ = data.height + 26;
      if(_loc1_ < 78)
      {
         _loc1_ = 78;
      }
      var _loc3_ = Math.max(data.width + 12,145);
      data.target.__owner.setSize(_loc3_,_loc1_);
   }
   function restart()
   {
      this.stGrid.removeAll();
      this.lastStat = null;
      this.cGrid.removeAll();
      this.DC_1.clear();
      this.DC_2.clear();
      this.DC_3.clear();
      this.onRefresh();
   }
   function onDeactivate()
   {
      this.restart();
   }
   function onRefresh()
   {
      var _loc2_ = new Object();
      _loc2_.length = 0;
      this.__get__fc().call(this.__get__server(),"getNetStreams",new this.ResBind(this.onStreams,this,this.DC_3,_loc2_),this.__get__app());
      this.__get__fc().call(this.__get__server(),"getLiveStreams",new this.ResBind(this.onStreams,this,this.DC_2,_loc2_),this.__get__app());
      this.__get__fc().call(this.__get__server(),"getRecordedStreams",new this.ResBind(this.onStreams,this,this.DC_1,_loc2_),this.__get__app());
      if(this.__get__app() == this.owner.selectedApplication)
      {
         this.playBtn._visible = this.owner.infoArray[this.__get__app()].debug == true;
      }
   }
   function onStreams(result, dc, q)
   {
      if(result.level == "status")
      {
         dc.onData(result.data);
      }
      q.length = q.length + 1;
      if(q.length == 3)
      {
         false;
         if(this.stGrid.selectedItem)
         {
            var _loc2_ = this.stGrid.selectedItem.name;
            if(this.stGrid.selectedItem.type == "Stored")
            {
               this.__get__fc().call(this.__get__server(),"getRecordedStreamStats",new this.ResBind(this.onStreamStatus,this,this.stGrid.selectedItem.type,this.__get__app()),this.__get__app(),_loc2_);
            }
            else if(this.stGrid.selectedItem.type == "NetStream")
            {
               this.__get__fc().call(this.__get__server(),"getNetStreamStats",new this.ResBind(this.onStreamStatus,this,this.stGrid.selectedItem.type,this.__get__app()),this.__get__app(),_loc2_);
            }
            else
            {
               this.__get__fc().call(this.__get__server(),"getLiveStreamStats",new this.ResBind(this.onStreamStatus,this,this.stGrid.selectedItem.type,this.__get__app()),this.__get__app(),_loc2_);
            }
         }
      }
   }
   function onNewItem(name, type)
   {
      var _loc2_ = undefined;
      if(type == "Live")
      {
         _loc2_ = this.stGrid.addItem({name:name,type:type});
      }
      else
      {
         _loc2_ = this.stGrid.addItem({name:name,type:type});
      }
      this.onItemPersist(name,type,_loc2_);
      return _loc2_;
   }
   function onStreamStatus(result, type, str)
   {
      var _loc7_ = type + ":" + str;
      var _loc3_ = result.data;
      if(this.lastStat != _loc7_)
      {
         this.cGrid.removeAll();
         if(type == "Stored")
         {
            this.v1MC.label = "Properties";
            this.v2MC.label = "Values";
            this.addToolTip("Stream Properties",this.v1MC);
            this.addToolTip("Property Values",this.v2MC);
            this.cGrid.addItem({v1:"Size",v2:"--"});
            this.cGrid.addItem({v1:"Modified",v2:"--"});
            this.cGrid.addItem({v1:"Cache Misses",v2:"--"});
            this.cGrid.addItem({v1:"Cache Hits",v2:"--"});
            this.cGrid.addItem({v1:"Cache Segments",v2:"--"});
            this.cGrid.addItem({v1:"Cache Bytes",v2:"--"});
         }
         else if(type == "NetStream")
         {
            this.v1MC.label = "Properties";
            this.v2MC.label = "Values";
            this.addToolTip("Stream Properties",this.v1MC);
            this.addToolTip("Property Values",this.v2MC);
            this.cGrid.addItem({v1:"Name",v2:"--"});
            this.cGrid.addItem({v1:"Status",v2:"--"});
            this.cGrid.addItem({v1:"Client",v2:"--"});
            this.cGrid.addItem({v1:"Time",v2:"--"});
         }
         else
         {
            this.v1MC.label = "Client ID";
            this.v2MC.label = "Status";
            this.addToolTip("Unique Client ID",this.v1MC);
            this.addToolTip("Current Activity",this.v2MC);
         }
         this.cGrid.redrawHead();
      }
      this.lastStat = _loc7_;
      if(type == "Stored")
      {
         this.cGrid.getItemAt(0).v2 = _loc3_.size;
         this.cGrid.getItemAt(1).v2 = new Date(_loc3_.modified_time * 1000);
         this.cGrid.getItemAt(2).v2 = _loc3_.cache_misses;
         this.cGrid.getItemAt(3).v2 = _loc3_.cache_hits;
         this.cGrid.getItemAt(4).v2 = _loc3_.cache_segments;
         this.cGrid.getItemAt(5).v2 = _loc3_.cache_bytes;
      }
      else if(type == "NetStream")
      {
         _loc3_ = _loc3_[0];
         this.cGrid.getItemAt(0).v2 = _loc3_.name;
         if(_loc3_.name == "")
         {
            this.cGrid.getItemAt(0).v2 = "--";
         }
         this.cGrid.getItemAt(1).v2 = _loc3_.type;
         this.cGrid.getItemAt(2).v2 = _loc3_.client;
         this.cGrid.getItemAt(3).v2 = _loc3_.time;
      }
      else
      {
         var _loc8_ = this.cGrid.selectedIndex;
         this.cGrid.removeAll();
         if(_loc3_.publisher)
         {
            this.cGrid.addItem({v1:_loc3_.publisher.client,v2:"Publishing - {" + result.data.publisher.time + "}"});
         }
         var _loc2_ = 0;
         while(_loc2_ < _loc3_.subscribers.length)
         {
            this.cGrid.addItem({v1:_loc3_.subscribers[_loc2_].client,v2:"Viewing - {" + _loc3_.subscribers[_loc2_].subscribe_time + "}"});
            _loc2_ = _loc2_ + 1;
         }
         this.cGrid.selectedIndex = _loc8_;
      }
   }
   function onItemPersist(name, type, data)
   {
   }
   function onLostItem(name, type, data)
   {
      this.stGrid.removeItemAt(data.id);
   }
   function onSetApp()
   {
      this.restart();
   }
   function onSetServer()
   {
      this.restart();
   }
   function setSize(w, h)
   {
      if(w < 12)
      {
         this.stGrid._visible = false;
         this.cGrid._visible = false;
      }
      else
      {
         this.stGrid._visible = true;
         this.cGrid._visible = false;
      }
   }
}
