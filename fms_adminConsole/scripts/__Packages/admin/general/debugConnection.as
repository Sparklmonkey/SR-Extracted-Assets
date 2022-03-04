class admin.general.debugConnection
{
   function debugConnection()
   {
   }
   function connect()
   {
      this.nc = new NetConnection();
      var owner = this;
      this.nc.onStatus = function(info)
      {
         owner.connection.allowCalls(owner.nID,owner);
         owner.onStatus(info);
         _global.appsContainer.debugStatus();
      };
      arguments[0] = this.escapeURI(arguments[0]);
      this.nc.connect.apply(this.nc,arguments);
   }
   function escapeURI(uri)
   {
      var _loc1_ = uri.indexOf("?");
      if(_loc1_ == -1)
      {
         return uri;
      }
      var _loc2_ = uri.substring(0,_loc1_);
      uri = uri.substring(_loc1_);
      return _loc2_ += escape(uri);
   }
   function call()
   {
      this.nc.call.apply(this.nc,arguments);
   }
   function get uri()
   {
      return this.nc.uri;
   }
   function get isConnected()
   {
      return this.nc.isConnected;
   }
   function close()
   {
      this.nc.close();
   }
}
