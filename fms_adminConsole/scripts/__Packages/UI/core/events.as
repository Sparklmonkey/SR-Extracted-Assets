class UI.core.events extends UI.core.movieclip
{
   function events()
   {
      super();
      if(!_global.fm)
      {
         _global.fm = new UI.core.focusManager();
      }
      this.createEmptyMovieClip("__to",-7);
      var o = this;
      this.__to.onSetFocus = function()
      {
         _global.fm.initFocus(o);
      };
      this.listners = new Object();
      this.focusEnabled = false;
      this.tabEnabled = false;
      this._focusrect = false;
      _global.fm.registerMC(this);
   }
   function blockFocus()
   {
      _global.fm.blockFocus(this);
   }
   function tabOwner()
   {
      return this.__to;
   }
   function getFocus()
   {
      var selFocus = Selection.getFocus();
      return selFocus !== null ? eval(selFocus) : null;
   }
   function setFocus()
   {
      Selection.setFocus(this);
   }
   function notab(mc)
   {
      mc._focusrect = false;
      mc.focusEnabled = false;
      mc.tabEnabled = false;
   }
   function dispatchEvent(type, par)
   {
      var _loc4_ = new Array();
      _loc4_.push(par);
      var _loc3_ = undefined;
      if(!this.forwardEvent)
      {
         _loc3_ = this.listners[type];
      }
      else
      {
         _loc3_ = this.forwardEvent.listners[type];
      }
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         _loc3_[_loc2_].cb.apply(_loc3_[_loc2_].ct,_loc4_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function addListener(type, callback, context)
   {
      var _loc2_ = this.listners[type];
      if(!_loc2_)
      {
         var _loc0_ = null;
         _loc2_ = this.listners[type] = new Array();
      }
      _loc2_.push({ct:context,cb:callback});
   }
   function removeListener(type, callback)
   {
      var _loc3_ = this.listners[type];
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].cb == callback)
         {
            _loc3_.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
}
