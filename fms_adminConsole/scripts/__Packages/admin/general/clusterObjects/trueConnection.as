class admin.general.clusterObjects.trueConnection extends admin.general.FCSEngine
{
   function trueConnection(id, data, o, stat)
   {
      super();
      this.__id = id;
      this.__owner = o;
      this.onStatus2 = stat;
      this.reconnect(data);
   }
   function get isConnected()
   {
      return this._nc.isConnected;
   }
   function reconnect(data)
   {
      this.firstResult = false;
      this._nc = new NetConnection();
      var o = this;
      this._nc.fpadZone = -1;
      this._nc.onStatus = function(info)
      {
         if(info.code == "NetConnection.Connect.Success")
         {
            o.connTime = new Date();
         }
         if(o._closeFlag != true)
         {
            if(o.firstResult == false)
            {
               o.firstResult = true;
               if(o.isConnected == true)
               {
                  o.call("getAdminContext",new o.ResBind(o.getAdmin,o));
               }
               else
               {
                  o.__owner.setServerStatus(o.__id,o.isConnected);
               }
            }
            else
            {
               o.__owner.setServerStatus(o.__id,o.isConnected);
            }
         }
         o.onStatus(info);
         o.onStatus2(info);
      };
      this._nc.connect(this.paddServer(data.server),data.user,data.pass);
   }
   function getAdmin(result)
   {
      this.adminLevel = result.data;
      this.__owner.setServerStatus(this.__id,this.__get__isConnected());
   }
   function paddServer(str)
   {
      if(str.indexOf("://") == -1)
      {
         str = "rtmp://" + str;
      }
      if(str.slice(6,str.length).indexOf(":") == -1)
      {
         str += ":1111";
      }
      if(str.indexOf("/admin") == -1)
      {
         str += "/admin";
      }
      return str;
   }
   function close()
   {
      this._closeFlag = true;
      this._nc.close();
      delete this._nc;
   }
   function call()
   {
      if(this.canCall != false && this._nc.isConnected == true)
      {
         this._nc.call.apply(this._nc,arguments);
      }
   }
   function get nc()
   {
      return this._nc;
   }
}
