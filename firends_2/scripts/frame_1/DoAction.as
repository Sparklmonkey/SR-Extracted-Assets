tBytes = this.getBytesTotal();
trace(this);
this.onEnterFrame = function()
{
   var _loc1_ = this;
   bLoaded = _loc1_.getBytesLoaded();
   if(bLoaded == tBytes)
   {
      delete _loc1_.onEnterFrame;
      _loc1_.desc = root.loadFriendDesc(_loc1_);
      gotoAndStop(_loc1_.desc.typeSex);
   }
};
stop();
