class UI.core.Form extends UI.core.movieclip
{
   function Form()
   {
      super();
      this.keysToCheck = new Object();
      this.kListner = new Object();
      var owner = this;
      this.kListner.onKeyDown = function()
      {
         owner.__workKeyDown(Key.getAscii());
      };
      Key.addListener(this.kListner);
   }
   function keyToEvent(key, m, ct)
   {
      var _loc4_ = key.charCodeAt(0);
      var _loc3_ = new Array();
      _loc3_.concat(arguments);
      _loc3_.splice(0,3);
      this.keysToCheck["k" + _loc4_] = {f:m,ct:ct,a:_loc3_};
   }
   function disposeForm()
   {
      Key.removeListener(this.kListner);
   }
   function __workKeyDown(key)
   {
      var _loc2_ = this.keysToCheck["k" + key];
      if(_loc2_)
      {
         _loc2_.f.apply(_loc2_.ct,_loc2_.a);
      }
   }
   function addControl(type, n, depth, data)
   {
      var _loc3_ = this.attachMovie(type,n,depth);
      _loc3_.inForm = true;
      if(data.width)
      {
         _loc3_.setSize(data.width,data.height);
      }
      for(var _loc4_ in data)
      {
         if(_loc4_ != "width" && _loc4_ != "height")
         {
            _loc3_[_loc4_] = data[_loc4_];
         }
      }
      return _loc3_;
   }
   function closeForm()
   {
      _global.form_manager.closeForm(true);
   }
}
