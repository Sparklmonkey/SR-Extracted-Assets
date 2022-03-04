class admin.general.DataCompare
{
   function DataCompare()
   {
      this.__store = new Object();
   }
   function getByID(id)
   {
      return this.__store[id];
   }
   function killByID(id)
   {
      delete this.__store[id];
      this.__store[id] = null;
      delete this.__store[id];
   }
   function clear()
   {
      this.__store = new Object();
   }
   function onData(d)
   {
      var _loc5_ = "";
      for(var _loc9_ in this.__store)
      {
         _loc5_ += _loc9_ + ",";
      }
      for(var _loc8_ in d)
      {
         var _loc3_ = d[_loc8_];
         if(!this.__store[_loc3_])
         {
            this.__store[_loc3_] = this.owner.onNewItem(_loc3_,this.type);
         }
         else
         {
            _loc5_ = _loc5_.split(_loc3_ + ",").join("");
            this.owner.onItemPersist(_loc3_,this.type,this.__store[_loc3_]);
         }
      }
      var _loc4_ = _loc5_.split(",");
      var _loc2_ = 0;
      while(_loc2_ < _loc4_.length)
      {
         var _loc6_ = this.owner.onLostItem(_loc4_[_loc2_],this.type,this.__store[_loc4_[_loc2_]]);
         if(_loc6_ != true)
         {
            delete this.__store[_loc4_[_loc2_]];
            this.__store[_loc4_[_loc2_]] = null;
            delete this.__store[_loc4_[_loc2_]];
         }
         _loc2_ = _loc2_ + 1;
      }
   }
}
