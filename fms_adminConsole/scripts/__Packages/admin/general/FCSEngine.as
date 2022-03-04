class admin.general.FCSEngine
{
   function FCSEngine()
   {
   }
   function ResBind(method, obj)
   {
      var a = new Array();
      var _loc3_ = 2;
      while(_loc3_ < arguments.length)
      {
         a.push(arguments[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
      this.onResult = function(data)
      {
         a.splice(0,0,data);
         method.apply(obj,a);
      };
   }
}
