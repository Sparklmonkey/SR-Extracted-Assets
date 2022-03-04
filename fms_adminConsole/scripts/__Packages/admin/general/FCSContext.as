class admin.general.FCSContext extends admin.general.FCSEngine
{
   function FCSContext()
   {
      super();
      _global.fcsct = this;
   }
   function get adminType()
   {
      return this.__al;
   }
   function call()
   {
      _global.conn.call.apply(_global.conn,arguments);
   }
}
