class admin.general.Cache
{
   function Cache()
   {
      _global.l_cache = this;
      this.__so = SharedObject.getLocal("fms_admin_cache","/");
   }
   function getProp(p, def)
   {
      if(!this.__so.data[p])
      {
         this.setProp(p,def);
      }
      return this.__so.data[p];
   }
   function setProp(p, d)
   {
      this.__so.data[p] = d;
   }
   function clear()
   {
      this.__so.clear();
   }
   function flush()
   {
      this.__so.flush();
   }
}
