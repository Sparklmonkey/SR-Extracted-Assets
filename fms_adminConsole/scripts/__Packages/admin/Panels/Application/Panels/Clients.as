class admin.Panels.Application.Panels.Clients extends admin.panel
{
   function Clients()
   {
      super();
      this.attachMovie("DataGrid","cGrid",0);
      this.cGrid.addColumn("cID","Client ID",80,"Server-generated Client ID",8);
      this.cGrid.addColumn("proto","Protocol",67,"Protocol: rtmp, rtmpt, or rtmps",8);
      this.cGrid.addColumn("b_in","Bytes In",68,"Bytes from the client",8);
      this.cGrid.addColumn("b_out","Bytes Out",70,"Bytes to the client",8);
      this.cGrid.addColumn("c_time","Connection Time",110,"Time the client connected",8);
      this.cGrid.addColumn("m_in","Messages In",88,"Messages from the client",8);
      this.cGrid.addColumn("m_out","Messages Out",90,"Messages to the client",8);
      this.cGrid.addColumn("drops","Drops",56,"Messages dropped by the client",8);
      this.cGrid.rowColors = [15595519,16777215];
      this.clientTest = new Object();
      this.DC_1 = new admin.general.DataCompare();
      this.DC_1.owner = this;
   }
   function firstDraw()
   {
      this.nextTab(this.cGrid);
   }
   function onRefresh()
   {
      this.__get__fc().call(this.__get__server(),"getUsers",new this.ResBind(this.onGetUsers,this),this.__get__app());
   }
   function onDeactivate()
   {
   }
   function onGetUsers(result)
   {
      if(result.level == "status")
      {
         this.DC_1.onData(result.data);
      }
   }
   function onLogout()
   {
      this.cGrid.removeAll();
   }
   function onNewItem(name, type)
   {
      var _loc2_ = this.cGrid.addItem({cID:name,proto:"--",b_in:"--",b_out:"--",c_time:"--",m_in:"--",m_out:"--",drops:"--"});
      this.onItemPersist(name,type,_loc2_);
      return _loc2_;
   }
   function onItemPersist(name, type, data)
   {
      this.__get__fc().call(this.__get__server(),"getUserStats",new this.ResBind(this.onUserStat,this,name),this.__get__app(),name);
   }
   function onUserStat(result, cID)
   {
      if(result.level == "status")
      {
         var _loc2_ = this.DC_1.getByID(cID);
         var _loc3_ = result.data;
         _loc2_.proto = _loc3_.protocol;
         _loc2_.b_in = _loc3_.bytes_in;
         _loc2_.b_out = _loc3_.bytes_out;
         _loc2_.c_time = _loc3_.connect_time;
         _loc2_.m_in = _loc3_.msg_in;
         _loc2_.m_out = _loc3_.msg_out;
         _loc2_.drops = _loc3_.msg_dropped;
      }
   }
   function onLostItem(name, type)
   {
      var _loc2_ = this.DC_1.getByID(name);
      this.cGrid.removeItemAt(_loc2_.id);
   }
   function setSize(w, h)
   {
      this.cGrid.setSize(w,h);
      if(w < 12)
      {
         this.cGrid._visible = false;
      }
      else
      {
         this.cGrid._visible = true;
      }
   }
   function restart()
   {
      this.cGrid.removeAll();
      this.DC_1.clear();
      this.onRefresh();
   }
   function onSetApp()
   {
      this.restart();
   }
   function onSetServer()
   {
      this.restart();
   }
}
